Dir[File.join(File.dirname(__FILE__), '../../sections/*/*.rb')].sort.each { |file| require file }

module Web
  module Pages
    module Cadastro
      class Cadastro < SitePrism::Page
        set_url '/parabank/register.htm'

        section :form_cadastro, Web::Sections::FormCadastro::FormCadastro, 'table.form2'

      end
    end
  end
end

