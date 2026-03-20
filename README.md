# AlgoriseMailer 🚀

**AlgoriseMailer** é um Micro SaaS de E-mail Marketing focado no setor público. Desenvolvido para alta entregabilidade e baixo custo, ele utiliza uma arquitetura moderna e desacoplada.

## 🛠️ Stack Tecnológica
- **Frontend:** HTML5, Vanilla JavaScript, Tailwind CSS (via CDN) e Phosphor Icons.
- **Backend / Orquestração:** [n8n](https://n8n.io/) hospedado via Easypanel.
- **Banco de Dados:** PostgreSQL.
- **Motor de Envio:** Brevo (integrado via n8n).

## 📌 Arquitetura
O sistema funciona de forma assíncrona e sem um backend tradicional (Node/Python):
1. O **Frontend** coleta os dados (ex: upload de CSV ou criação de campanha).
2. O **Frontend** dispara um Webhook para o **n8n**.
3. O **n8n** processa a lógica, interage com o **Postgres** e gerencia os envios via **Brevo**.

## 📂 Estrutura do Projeto
- `index.html`: Dashboard principal e gestão de contatos.
- `schema.sql`: Definição das tabelas do Postgres (Usuários, Contatos, Campanhas, Logs).
- `n8n_workflow_contatos_insert.json`: Fluxo do n8n para ingestão de contatos.
- `plan.md`: Roadmap e regras de desenvolvimento do projeto.

## 🚀 Como Executar
1. **Banco de Dados:** Aplique o `schema.sql` no seu banco de dados PostgreSQL.
2. **n8n:**
   - Importe os fluxos JSON na sua instância n8n.
   - Configure as credenciais do **Postgres** e **Brevo**.
3. **Frontend:**
   - Abra o `index.html` em qualquer servidor estático ou diretamente no navegador.
   - Configure a URL do Webhook do n8n no JavaScript (ou via `.env` se utilizar um builder).

## 🧪 Próximos Passos
- [ ] Implementar a gestão de campanhas.
- [ ] Adicionar dashboard de métricas (aberturas, cliques).
- [ ] Implementar o pixel de rastreio para monitoramento de leitura.

---
Desenvolvido por **Joabe Oliveira** para o ecossistema gptGOV.
