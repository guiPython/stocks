# Application

As operações que vamos construir nessa camada são relacionadas
as ações que podemos fazer com nossas ações (**Stocks**), são elas:

- Monitorar uma ação 
- Consultar uma ação 

## Monitoramento

Para esse caso de uso temos como parâmetro o **nome** da ação e queremos que caso ele seja válido a **persistência** ocorra em algum lugar.

## Consulta

Para a consulta temos o recebimento do **nome** da ação também, caso ele seja **válido** enviamos para uma abstração que faça o retorno da estrutura **Stock**.