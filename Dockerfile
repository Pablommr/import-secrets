# Usando imagem base alpine
FROM alpine:3.20.3

# Definindo o diretório de trabalho
WORKDIR /app

# Copiando o script entrypoint.sh para o contêiner
COPY entrypoint.sh /app/entrypoint.sh

# Dando permissão de execução ao script
RUN chmod +x /app/entrypoint.sh

# Definindo o script como entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]