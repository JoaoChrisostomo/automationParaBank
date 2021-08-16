# language: pt

@autenticacao
Funcionalidade: cadastro
  Como um usuário
  Quero realizar cadastro
  Para facilitar a navegação

  Contexto:
  Dado que esteja na pagina de cadastro

  @cadastro_valido
  Cenário: Realizar cadastro com dados válidos
    Quando preencher os campos de cadastro
    Entao deverá ser exibido usuário logado

  @cadastros_invalidos
  Esquema do Cenário: Realizar cadastro com dados inválidos
    Quando realizar cadastro com erros "<erros>"
    Entao deverá ser exibido a mensagem de erro no cadastro "<mensagem>"

    Exemplos:
      | erros                               | mensagem                                  |
      | campo_obrigatorio_em_branco         | Password confirmation is required.        |
      | usuario_existente                   | This username already exists.             |
