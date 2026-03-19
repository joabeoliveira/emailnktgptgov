# Contexto do Projeto: AlgoriseMailer (Micro SaaS MVP)

## 📌 Visão Geral
Este é um Micro SaaS de E-mail Marketing desenvolvido para o setor público, com o objetivo de divulgar a "gptGOV Academy" e o "Sistema Algorise". O sistema é focado em alta entregabilidade, baixo custo de infraestrutura e arquitetura resiliente. Inicialmente operará para uso interno, mas a estrutura já é projetada para o modelo multi-tenant (SaaS).

## 🛠️ Stack Tecnológica (A Arquitetura)
- **Frontend:** HTML5, Vanilla JavaScript, Tailwind CSS (via CDN para produtividade) e Phosphor Icons. SEM frameworks pesados (sem React, Vue, etc).
- **Backend / Orquestração:** n8n (hospedado via Easypanel). O n8n atuará como o único backend, recebendo requisições via Webhooks. Não haverá API customizada em Node/Python.
- **Banco de Dados:** PostgreSQL.
- **Motor de Envio (SMTP/API):** Brevo (integrado exclusivamente via n8n). O frontend não se comunica com o Brevo.

## ⚠️ Regras de Ouro para o GitHub Copilot (Restrições)
1. **Mantenha o Frontend Simples:** Todo código JavaScript deve ser Vanilla. Use a API `fetch` para comunicação externa. Não sugira a instalação de pacotes npm para o frontend neste momento.
2. **Arquitetura Desacoplada:** O frontend só deve se comunicar com URLs de Webhooks do n8n.
3. **Multi-tenant by Design:** TODA query SQL ou payload de envio deve conter o `usuario_id` (atualmente mockado como `1` para o MVP). Nenhuma ação deve ocorrer sem referenciar o dono do dado.
4. **Design Limpo:** O Tailwind deve ser usado para criar interfaces corporativas, limpas e modernas (inspiradas em painéis SaaS premium).

## 🗄️ Estrutura do Banco de Dados Atual
- `usuarios`: id, nome, email, created_at.
- `contatos`: id, usuario_id, nome, email, tags, status, created_at.
- `campanhas`: id, usuario_id, nome, assunto, corpo_html, status, created_at.
- `logs_envio`: id, campanha_id, contato_id, status (pendente, enviado, falha, lido), opened_at.

## ✅ Status Atual (O que já foi feito)
- [x] Definição da arquitetura (Frontend Estático -> n8n -> PostgreSQL/Brevo).
- [x] Criação do `schema.sql` com as tabelas fundamentais.
- [x] Criação do `index.html` (Dashboard inicial com layout em Tailwind).
- [x] Implementação da lógica de upload e conversão de `.csv` para JSON via Vanilla JS.
- [x] Integração do formulário de upload com o Webhook de ingestão do n8n.

## 🚀 Próximos Passos (Backlog Imediato)
1. Criar a tela/modal para **Criação de Campanhas** (Nome, Assunto, Editor de Texto Rico simples).
2. Desenvolver a lógica para buscar a lista de contatos do n8n via Webhook (GET) e popular a tabela do `index.html`.
3. Criar os fluxos no n8n de "Disparo de E-mail" via Brevo e "Captura de Pixel de Leitura" (Tracking).