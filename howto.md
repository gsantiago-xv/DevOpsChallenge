O que foi feito:

    1- Criada a conta no Azure

    2- Foi criado um grupo de recursos com os dois serviços de aplicativo para os ambientes de DEV e PROD. Esses dois serviços estão configurados para a publicação de um contêiner do Docker, então também foi criado um registro de contêiner no ACR para armazenar a imagem da aplicação.

    3- Liberação para acessar externamente o DNS dos dois ambientes.

    4- Criado o Dockerfile na raiz do projeto para o build da aplicação e geração da imagem, no mesmo incluida a variavél de ambiente "ASPNETCORE_ENVIRONMENT=" para diferenciar os ambientes.

    5- Criado os diretórios ".github/workflows/" para utilizar o GitHub Actions, e em seguida criado o arquivo "ci-cd.yml" com as instruções de build e deploy da aplicação.


Para verificar o resultado: 

    PROD:
        https://nibodocker-prod.azurewebsites.net/WeatherForecast

    DEV:
        https://nibodocker-dev.azurewebsites.net/WeatherForecast

