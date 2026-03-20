# AlgoriseMailer 🚀

**AlgoriseMailer** é um Micro SaaS de E-mail Marketing focado no setor público. Desenvolvido para alta entregabilidade e baixo custo, ele utiliza uma arquitetura moderna e desacoplada.

## 📊 Status Atual
Para ver o progresso detalhado do desenvolvimento e o roadmap, consulte o arquivo [Status_projeto.md](./Status_projeto.md).

---

## 🛠️ Stack Tecnológica
- **Frontend:** HTML5, Vanilla JavaScript, Tailwind CSS e Phosphor Icons.
- **Backend / Orquestração:** [n8n](https://n8n.io/) hospedado via Easypanel.
- **Banco de Dados:** PostgreSQL.
- **Motor de Envio:** Brevo (integrado via n8n).

## 📂 Estrutura do Projeto
- `index.html`: Dashboard principal e gestão de contatos.
- `schema.sql`: Definição das tabelas do Postgres (Usuários, Contatos, Campanhas, Logs).
- `workflows/`: Fluxos JSON para importação no n8n.
- `workflows/migracao_grupos.sql`: Migração para suporte a grupos/listas de envio.
- `workflows/crud_unificado_grupos.json`: Webhook único `POST /crm` para CRUD de contatos, grupos, campanhas e vínculos.
- `Status_projeto.md`: Roadmap e acompanhamento das fases.

## 🚀 Como Executar
1. **Banco de Dados:** Aplique o `schema.sql` no seu banco de dados PostgreSQL.
2. **Grupos/Listas (novo):** Aplique o `workflows/migracao_grupos.sql` para criar `grupos`, `contato_grupos` e `campanhas.grupo_id`.
2. **n8n:**
   - Importe os fluxos JSON na sua instância n8n.
    - Importe também `workflows/crud_unificado_grupos.json`.
   - Configure as credenciais do **Postgres** e **Brevo**.
3. **Frontend:**
   - Abra o `index.html` em qualquer servidor estático ou diretamente no navegador.
   - Configure a URL do Webhook do n8n nas variáveis do JavaScript.

## 📬 Contrato do Webhook Unificado (`POST /crm`)
Payload base:

```json
{
   "entidade": "contato|grupo|campanha|vinculo",
   "acao": "create|list|update|delete",
   "usuario_id": 1,
   "dados": {}
}
```

Exemplo de criação de grupo:

```json
{
   "entidade": "grupo",
   "acao": "create",
   "usuario_id": 1,
   "dados": {
      "nome": "Prefeituras SP",
      "descricao": "Leads do estado de SP"
   }
}
```

Exemplo de vínculo contato-grupo:

```json
{
   "entidade": "vinculo",
   "acao": "create",
   "usuario_id": 1,
   "dados": {
      "contato_id": 10,
      "grupo_id": 2
   }
}
```

---
Desenvolvido por **Joabe Oliveira** para o ecossistema gptGOV.
