# Use a imagem oficial do Golang como imagem base
FROM golang:latest

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos Go necessários para o contêiner
COPY main.go /app/

# Copie a pasta "static" com seus arquivos HTML e CSS para o contêiner
COPY static/ /app/static/

# Compile o código Go
RUN go build main.go

# Exponha a porta em que a aplicação Go está escutando (5000 neste caso)
EXPOSE 5000

# Comando para executar a aplicação quando o contêiner for iniciado
CMD ["./main"]
