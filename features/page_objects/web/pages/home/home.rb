Dir[File.join(File.dirname(__FILE__), '../../sections/*/*.rb')].sort.each { |file| require file }

module Web
  module Pages
    module Home
      class Home < SitePrism::Page
        set_url '/'

        #element :input_username, :xpath, '//input[@name="username"]'
        element :input_username, 'input[name="username"]'
        element :input_password, 'input[name="password"]'
        element :btn_login, '[value="Log In"]'
        element :span_welcome, '#leftPanel .smallText'
        element :p_error_login, '[class="error"]'


        def exec_login(username, password)
          input_username.set username
          input_password.set password
          btn_login.click
        end
      end
    end
  end
end
