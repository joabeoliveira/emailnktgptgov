# 📋 Status do Projeto - AlgoriseMailer

Aqui está o rastreamento em tempo real do desenvolvimento deste Micro SaaS.

## 📊 Status Geral: `OPERACIONAL` ✅ (Em Produção)
O sistema já é capaz de gerenciar contatos, criar rascunhos de e-mail marketing e disparar envios personalizados via Brevo.

## 🆕 Atualizações Recentes (20/03/2026)
- [x] Dashboard separado por views (`dashboard`, `contatos`, `campanhas`) com carregamento dinâmico.
- [x] Dashboard operacional com métricas, listas recentes e mini gráficos por status.
- [x] Timestamp de última atualização dos dados no dashboard.
- [x] Workflow n8n unificado de CRUD criado em `workflows/crud_unificado_grupos.json`.
- [x] Migração de grupos/listas criada em `workflows/migracao_grupos.sql`.

---

## ✅ Entregas Concluídas (Fase 1)

### 1. Dashboard de Gestão
- [x] Interface moderna com TailwindCSS e Phosphor Icons.
- [x] Listagem em tempo real de contatos (Postgres).
- [x] Listagem de campanhas salvas (Postgres).

### 2. Fluxos n8n (Orquestração)
- [x] Webhook de Inserir Contato (com lógica de Upsert/Não-Duplicação).
- [x] Webhooks de Listagem (Contatos e Campanhas).
- [x] Webhook de Criar Campanha (Salvar Rascunho HTML).
- [x] Motor de Disparo (Substituição de tags `{{nome}}` no HTML e envio via Brevo API).

### 3. Banco de Dados (PostgreSQL)
- [x] Tabelas `usuarios`, `contatos` e `campanhas`.
- [x] Nova tabela `logs_envio` para rastreamento de disparos.

---

## 📅 Roadmap - Próximas Fases

### **Fase 2: Inteligência & Tracking 📈 (Prioridade)**
- [ ] **Rastreamento de Leitura:** 
    - [ ] Criar Webhook Listeners para eventos "Opened" e "Clicked" do Brevo.
    - [ ] Atualizar status na tabela `logs_envio` em tempo real.
- [ ] **Desativação Automática (Reputation Manager):**
    - [ ] Mudar status do contato para "Inativo" se houver Hard Bounce ou Unsubscribe.

### **Fase 3: CRUD & Flexibilidade 🛠️**
- [x] **Backend CRUD unificado (n8n):** Operações de `create/list/update/delete` para `contato`, `grupo`, `campanha` e `vinculo` via `POST /crm`.
- [ ] **UI de CRUD no Frontend:** Botões e formulários para criar/editar/excluir no painel.
- [ ] **Envio por Grupo:** Atualizar workflow de disparo para filtrar contatos por `campanhas.grupo_id`.

### **Fase 4: Experiência & Segurança 🔒**
- [ ] **Proteção de Acesso:** Implementar tela inicial de Login.
- [ ] **Banners Dinâmicos:** Usar IA para criar imagens de cabeçalho nos e-mails.

---
*Última atualização: 20/03/2026 às 14:30.*
