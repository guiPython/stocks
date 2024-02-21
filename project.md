# Stocks Project

O projeto tem como objetivo mostrar aplicações práticas de módulos "avançados" do Elixir, não será coberta toda a api dos módulos, porém a ideia é dar uma boa base de exemplos.

Os módulos que vamos explorar nesse projeto são:

- GenServer
- Registry
- Process

Nesse projeto é de **extrema** importância que você entenda como **processos** funcionam no Elixir. No canal temos uma playlist completa sobre processos que esclarece alguns conceitos importantes como ciclo de vida, comunicação, monitoramento e links.

Em algum momento do projeto vamos utilizar bibliotecas que nos auxiliam a construir algumas coisas como por exemplo um servidor HTTP, um cliente HTTP e um json parser, portanto pode ser útil ter esses conceitos bem definidos na cabeça.

Bibliotecas Externas:

- Http Poison (Http Client)
- Plug & Cowboy (Http Server)
- Poison (JSON Parser)

# Sobre o projeto

## Geral
A ideia é criar uma forma de consultar ativos financeiros de maneira automatizada, cada ativo (STOCK) deve ser representado de maneira **única** e **separada** dos demais, por simplificação estamos interessados em consultar o preço desses ativos enquanto o mercado de ações estiver aberto.

## Como fazer ?

### Instruções
A aplicação deve ser dividida em 3 módulos (PASTAS) gerais:

- domain
- application
- infrastructure

O módulo **domain** deve conter todo o código base de criação, validação e interação entre os conceitos mais básicos do nosso código, sem nenhuma dependencia com bibliotecas ou serviços externos. (1)

O módulo **application** deve conter apenas orquestrações das definições feitas no módulo **domain** e adicionar algumas coisas como logs por exemplo. (2)

Por fim temos o módulo **infrastructure** que pode fazer chamadas para as definições feitas nos módulos **domain**, **application** e ainda fazer integrações com serviços externos. (3)

#### **Http Client** e **GenServer**
Para atualizar as ações Vamos utilizar um serviço externo para consultar o preço delas, como dito cada ação será representada de maneira **única** e **separada** das demais, isto é, cada ação será um processo (Entidade Viva) no runtime e deve ser atualizada independente das outras. 

#### **Registry**
Após a criação de todo o código que representa uma ação trabalharemos em um forma de agrupa-las para facilitar a consulta por parte dos nossos outros módulos. 

#### **Server**
Com todo esse ferramental criado podemos fazer a interface de comunicação, penso que podemos fazer algo com **websocket** ou apenas uma **REST API**. 

### Dependência Externa
Vamos utilizar uma api chamada **Brapi**, ela tem um plano gratuito que permite 15k de requests mensais e tem boa parte dos ativos do mercado nacional.

Obs: Não sou patrocinado e não tenho qualquer relação com os mantenedores dessa API.