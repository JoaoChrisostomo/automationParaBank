Dir[File.join(File.dirname(__FILE__), '../../sections/*/*.rb')].sort.each { |file| require file }

module Web
  module Pages
    module Login
      class Login < SitePrism::Page
        set_url '/parabank/index.htm'

        element :input_login, :xpath, '//input[@name="username"]'
        element :input_senha, '[name="password"]'
        element :btn_login, '[value="Log In"]'

        #element :span_welcome, '#leftPanel .smallText'

        def realizar_login
          input_login.set "juzi"
          input_senha.set "jose"
          btn_login.click
        end
      end
    end
  end
end
