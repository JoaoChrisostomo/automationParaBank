Dado("que esteja na pagina home") do
  @home_page = $web_pages.home
  @home_page.load
end

Quando("realizar login") do
  valid_user = Factory::Static.static_data("usuario_valido")
  @home_page.exec_login(valid_user["username"], valid_user["password"])
end

Entao("será exibido usuário logado com sucesso") do
  expect(@home_page.span_welcome.text).to have_content 'Welcome'
end

Quando("realizar o login com {string}") do |tipo_usuario|
  user = Factory::Static.static_data(tipo_usuario)
  @home_page.exec_login(user["username"], user["password"])
  end

Então("deverá ser exibido a mensagem de erro {string}") do |mensagem|
  #@home_page.p_error_login(wait: 5)
  #@home_page.wait_until_p_error_login_visible
  expect(@home_page.p_error_login.text).to have_content mensagem
  end



