module Web
  module Sections
    module Header
      class MainHeader < SitePrism::Section

        elements :lista_de_btn_painel, '.button li'  #@header_section.menu.first.click assim eu clico em um elemento só
        elements :lista_de_btn_categorias, '.leftmenu li'
        element  :input_login, 'input[name=username]'
        element  :input_senha, 'input[name=password]'
      end
    end
  end
end
