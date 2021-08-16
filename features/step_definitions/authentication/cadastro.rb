Dado('que esteja na pagina de cadastro') do
  @cadastro_page = $web_pages.cadastro
  @cadastro_page.load
end

Quando('preencher os campos de cadastro') do
  valid_user = Factory::Dynamic.valid_user
  @cadastro_page.form_cadastro.register_user(valid_user)
  @home_page = $web_pages.home

end

Entao('deverá ser exibido usuário logado') do
  expect(@home_page.span_welcome.text).to have_content 'Welcome'
end

Quando('realizar cadastro com erros {string}') do |erros|
  user = Factory::Static.static_data(erros)
  @cadastro_page.form_cadastro.register_invalid(user)


end

Entao('deverá ser exibido a mensagem de erro no cadastro {string}') do |mensagem|
  expect(@cadastro_page.form_cadastro.span_campo_cadastro_em_branco.text).to have_content mensagem
  expect(@cadastro_page.form_cadastro.span_user_existent.text).to have_content mensagem
end


  #Factory::Static.static_data("usuario_existente")
