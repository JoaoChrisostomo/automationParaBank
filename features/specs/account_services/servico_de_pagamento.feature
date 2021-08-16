# language: pt

Funcionalidade: Transferência bancaria
  Eu como cliente no banco parabank
  Quero realizar uma Transferência
  Para pagar uma divida pendente

  Cenário: Realizar tipos de transferência
    Dado que esteja na pagina home
    Quando inserir os "<dados>"
    Então deverá ser exibido uma mensagem da transferência

    #Exemplos:


