# Usando imagem base alpine
FROM alpine:3.20.3

# Instala o dependências
RUN apk add --no-cache jq bash

# Definindo o diretório de trabalho
WORKDIR /

# Copiando o script entrypoint.sh para o contêiner
COPY entrypoint.sh /entrypoint.sh

# Dando permissão de execução ao script
RUN chmod +x /entrypoint.sh

# Definindo o script como entrypoint
ENTRYPOINT ["/entrypoint.sh"]