-- Tabela de Usuários (Preparando para o futuro Multi-tenant)
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Contatos (A base da sua audiência, ex: prefeitos, secretários)
CREATE TABLE contatos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id) ON DELETE CASCADE,
    nome VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    tags VARCHAR(255), -- Ex: 'prefeito', 'ti', 'saude'
    status VARCHAR(50) DEFAULT 'ativo', -- ativo, desinscrito, bounce
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(usuario_id, email) -- Evita contatos duplicados por usuário
);

-- Tabela de Campanhas (Os e-mails que serão disparados)
CREATE TABLE campanhas (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id) ON DELETE CASCADE,
    nome VARCHAR(255) NOT NULL, -- Nome interno (ex: Lançamento gptGOV)
    assunto VARCHAR(255) NOT NULL,
    corpo_html TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'rascunho', -- rascunho, processando, concluido
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de Logs de Envio (O rastreio granular para o Dashboard)
CREATE TABLE logs_envio (
    id SERIAL PRIMARY KEY,
    campanha_id INTEGER REFERENCES campanhas(id) ON DELETE CASCADE,
    contato_id INTEGER REFERENCES contatos(id) ON DELETE CASCADE,
    status VARCHAR(50) DEFAULT 'pendente', -- pendente, enviado, falha, lido
    opened_at TIMESTAMP WITH TIME ZONE, -- Registra quando o pixel de rastreio for acionado
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- INSERÇÃO DE TESTE (Para você criar seu primeiro usuário)
-- INSERT INTO usuarios (nome, email) VALUES ('Seu Nome', 'seu@email.com');