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
- `Status_projeto.md`: Roadmap e acompanhamento das fases.

## 🚀 Como Executar
1. **Banco de Dados:** Aplique o `schema.sql` no seu banco de dados PostgreSQL.
2. **n8n:**
   - Importe os fluxos JSON na sua instância n8n.
   - Configure as credenciais do **Postgres** e **Brevo**.
3. **Frontend:**
   - Abra o `index.html` em qualquer servidor estático ou diretamente no navegador.
   - Configure a URL do Webhook do n8n nas variáveis do JavaScript.

---
Desenvolvido por **Joabe Oliveira** para o ecossistema gptGOV.
