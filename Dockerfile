FROM nginx:stable-alpine

LABEL org.opencontainers.image.title="AlgoriseMailer"
LABEL org.opencontainers.image.description="Front-end estático para Algorise Mailer — deploy no Easypanel"
LABEL org.opencontainers.image.license="MIT"

WORKDIR /usr/share/nginx/html

# Copia todo o conteúdo do repositório para o diretório padrão do nginx
# O `Dockerfile` assume que a aplicação é um SPA estático (HTML/CSS/JS).
COPY . /usr/share/nginx/html

# Remove arquivos de exemplo do nginx.conf se houver (opcional)
RUN if [ -f /etc/nginx/conf.d/default.conf ]; then true; fi

EXPOSE 80

# Comando padrão do nginx é adequado para servir arquivos estáticos
CMD ["nginx", "-g", "daemon off;"]
