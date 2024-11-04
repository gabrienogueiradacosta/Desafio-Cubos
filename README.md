# Desafio técnico - Cubos DevOps

## Pré-requisitos

Você precisará ter os seguintes softwares instalados:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [WSL](https://docs.microsoft.com/pt-br/windows/wsl/install) (se estiver usando Windows)


## Executando o Projeto

Siga as etapas para executar o projeto:

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/gabrienogueiradacosta/Desafio-Cubos.git
   cd Desafio-Cubos

   No arquivo docker-compose atualize o caminho do volume (linha 10) e o context (linha 20) com o caminho correspondente da sua máquina
   entre na pasta "frontend" e utilize o comando "pwd" e copie o caminho.
    EX:
    volumes:
      - <seu_caminho>/nginx.conf:/etc/nginx/conf.d/default.conf 

2. **Construção dos containers**:
    sudo docker-compose up --build

3. **Acessando a aplicação**
    Acesse a aplicação frontend pelo navegador em: http://localhost

4. **Verificando logs**
    sudo docker-compose logs <container>
    ## Substitua <container> por frontend, backend, db, ou proxy para verificar as ações do container desejado

5. **Encerrar aplicação** 
    Encerre a execução da aplicação com ctrl+C no terminal
    Mas se desejar todos os containers após parar a execução deles utilize:
    **sudo docker-compose down** ou 
    **sudo docker-compose down -v** para encerrar os serviços de rede e volumes.

## Sinta-se a vontade para deixar comentários e dicas de melhorias :) ##
