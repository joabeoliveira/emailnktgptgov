# Patch do Workflow de Disparo por Grupo (n8n)

Este patch deve ser aplicado no workflow de disparo no **n8n** (nao no pgweb), ajustando os nos abaixo.

## Nos que voce precisa mudar

1. `Buscar Campanha` (Postgres)
2. `Buscar Contatos ATIVOS` (Postgres) -> renomear para `Buscar Contatos do Grupo`
3. `Salvar Log de Envio` (Postgres)
4. Adicionar IF: `Campanha tem grupo?`
5. Adicionar IF: `Envio OK?` (opcional, recomendado)

---

## 1) No `Buscar Campanha`

Use esta query:

```sql
SELECT id, usuario_id, nome, assunto, corpo_html, status, grupo_id
FROM campanhas
WHERE id = {{ $json.body.campanha_id }}
  AND usuario_id = {{ $json.body.usuario_id }}
LIMIT 1;
```

---

## 2) Adicionar IF `Campanha tem grupo?`

Condicao:

```text
{{ $("Buscar Campanha").first().json.grupo_id }}
```

Operador: `is not empty`

- `true` -> segue para buscar contatos
- `false` -> responder erro (campanha sem grupo definido)

---

## 3) No `Buscar Contatos ATIVOS` (renomeie para `Buscar Contatos do Grupo`)

Troque para:

```sql
SELECT c.id, c.nome, c.email, c.tags, c.status
FROM contatos c
JOIN contato_grupos cg ON cg.contato_id = c.id
WHERE c.usuario_id = {{ $("Buscar Campanha").first().json.usuario_id }}
  AND c.status = 'ativo'
  AND cg.grupo_id = {{ $("Buscar Campanha").first().json.grupo_id }}
ORDER BY c.id ASC;
```

---

## 4) No `Salvar Log de Envio`

### Branch de sucesso (`Envio OK?` = true)

```sql
INSERT INTO logs_envio (campanha_id, contato_id, status)
VALUES (
  {{ $("Buscar Campanha").first().json.id }},
  {{ $item(0).$node["Buscar Contatos do Grupo"].json.id }},
  'enviado'
);
```

### Branch de falha (`Envio OK?` = false)

```sql
INSERT INTO logs_envio (campanha_id, contato_id, status)
VALUES (
  {{ $("Buscar Campanha").first().json.id }},
  {{ $item(0).$node["Buscar Contatos do Grupo"].json.id }},
  'falha'
);
```

> Nao use `email` nem `message_id` nessa tabela enquanto essas colunas nao existirem no banco.

---

## 5) Recomendado: atualizar status da campanha

No inicio do disparo:

```sql
UPDATE campanhas
SET status = 'processando'
WHERE id = {{ $("Buscar Campanha").first().json.id }};
```

No final do loop:

```sql
UPDATE campanhas
SET status = 'concluido'
WHERE id = {{ $("Buscar Campanha").first().json.id }};
```

---

## Validacao rapida

- Campanha com `grupo_id` definido
- Existe vinculo em `contato_grupos`
- Contatos do grupo com status `ativo`
- Logs sendo gravados em `logs_envio` com `contato_id` e status correto
