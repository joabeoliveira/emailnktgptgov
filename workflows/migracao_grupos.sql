-- Migração para suportar listas/grupos no AlgoriseMailer
CREATE TABLE IF NOT EXISTS grupos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
    nome VARCHAR(120) NOT NULL,
    descricao TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (usuario_id, nome)
);

CREATE TABLE IF NOT EXISTS contato_grupos (
    contato_id INTEGER NOT NULL REFERENCES contatos(id) ON DELETE CASCADE,
    grupo_id INTEGER NOT NULL REFERENCES grupos(id) ON DELETE CASCADE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (contato_id, grupo_id)
);

ALTER TABLE campanhas
ADD COLUMN IF NOT EXISTS grupo_id INTEGER REFERENCES grupos(id) ON DELETE SET NULL;

CREATE INDEX IF NOT EXISTS idx_contato_grupos_grupo_id ON contato_grupos(grupo_id);
CREATE INDEX IF NOT EXISTS idx_contato_grupos_contato_id ON contato_grupos(contato_id);
CREATE INDEX IF NOT EXISTS idx_campanhas_grupo_id ON campanhas(grupo_id);
