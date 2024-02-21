# Domain

## Listagem
Para modelar o dominio dessa aplicação vamos escrever o que queremos fazer:

- Atualizar o preço de uma ação
- Consultar o preço de uma ação pelo seu nome
- Validar uma ação

## Analise
Vamos fazer um exercicio simples aqui, separe todos os substantivos e verbos das frases acima:

**Substantivos**: Preço, Ação, Nome.

**Verbos**: Atualizar, Consultar, Validar.

## Questionamentos
- Qual a relação entre o substantivos?
  - A ação contém um nome e um preço.

- Os conceitos nome e preço fazem sentido no dominio sozinhos?
  - Não, os conceitos só existem para descrever uma ação.

- Atualizar uma ação depende de alguma **"coisa"** externa ao dominio?
  - Sim e não, persistir a ação depende de algo externo, mutar o estado não.

- Consultar uma ação depedende de alguma **"coisa"** externa ao dominio?
  - Sim, nesse caso a consulta depende de serviços externos.

- Validar uma ação depedende de alguma **"coisa"** externa ao dominio?
  - Não, nesse caso a validação não precisa de nada externo ao dominio, basta ter um nome e um preço válido.

- O que é um nome e um preço válido?
  - Um nome válido deve conter mais que 5 caracteres e não mais que 6, para um preço ser válido ele não deve ser menor que 0.0
  
# Relações

Uma ação ou como chamaremos **Stock** é a **Entidade** da nossa aplicação, isso porque as operações **(verbos)** que listamos interagem diretamente com ela.

**Nome** e **Preço** são conceitos que descrevem uma **Stock** e não tem outra serventia além disso, portanto são nossos **Value Objects**.


Com relação aos verbos temos o seguinte:

A **Validação** ocorre na criação da estrutura **Stock**, ou seja,
é uma implementação direta no dominio.

A **Atualização** pode ocorrer na estrutura e por mutar o estado e exigir validação será uma implementação direta no dominio.

**Consulta** e **Atualização Persistente** ocorrem por meio de serviços externos, dessa forma vamos apenas criar abstrações. (**Behaviours**)
