# language: pt
@login
Funcionalidade: login
  Como usuário do site parabank
  Quero fazer login
  Para acessar meus dados

  Contexto:
  Dado que esteja na pagina home

  @login_sucesso
  Cenário: Realizar o login com sucesso
    Quando realizar login
    Entao será exibido usuário logado com sucesso

  @login_erros
  Esquema do Cenário: Realizar o login com erros
    Quando realizar o login com "<tipo_usuario>"
    Então deverá ser exibido a mensagem de erro "<mensagem>"

    Exemplos:
      | tipo_usuario            | mensagem                                            |
      | campos_em_branco        | Please enter a username and password.               |
      | senha_em_branco         | Please enter a username and password.               |
      | senha_errada            | An internal error has occurred and has been logged. |


