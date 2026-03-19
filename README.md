Resumo

Este repositório contém um exemplo de integração entre Google Apps Script (GAS) e um banco PostgreSQL hospedado em uma VPS (EasyPanel).

Arquivos criados

- gas/Code.gs — funções para configurar credenciais, testar conexão e executar queries.
- .env.local.sample — placeholders para uso local (opcional).

Como usar (GAS)

1. Abra um projeto no Google Apps Script.
2. Cole o conteúdo de `gas/Code.gs` no editor.
3. Configure as credenciais de conexão:
   - Abra `File > Project properties > Script properties` e adicione as chaves: `DB_HOST`, `DB_PORT`, `DB_NAME`, `DB_USER`, `DB_PASSWORD`, `DB_USE_SSL`.
   - Ou chame a função `setDbConfig(host, port, dbName, user, password, useSsl)` a partir do editor (execute manualmente).
4. Teste a conexão executando `testConnection()` no editor (Executar). Deve retornar `true` se OK.
5. Use `runQuery(sql, params)` para consultas (params é array opcional para PreparedStatement).

Observações importantes

- Sua VPS deve permitir conexões externas ao PostgreSQL a partir dos servidores do Google Apps Script. Configure o firewall no EasyPanel para permitir a porta (padrão 5432) ou use um túnel seguro.
- Se seu banco exigir SSL, defina `DB_USE_SSL` como `true` ou passe `useSsl=true` em `setDbConfig`.
- Por segurança, prefira salvar credenciais em Script Properties e não no código.

Se quiser, eu posso também:
- Gerar um exemplo em Node.js/Express que age como API intermediária.
- Instruções de firewall/ports específicas para EasyPanel.
