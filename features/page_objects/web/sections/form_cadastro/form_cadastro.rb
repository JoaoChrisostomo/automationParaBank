Dir[File.join(File.dirname(__FILE__), '../../sections/*/*.rb')].sort.each { |file| require file }

module Web
  module Sections
    module FormCadastro
      class FormCadastro < SitePrism::Section


        element :input_first_name, '[name="customer.firstName"]'
        element :input_last_name, '[name="customer.lastName"]'
        element :input_adress, '[name="customer.address.street"]'
        element :input_city, '[name="customer.address.city"]'
        element :input_state, '[name="customer.address.state"]'
        element :input_zip_code, '[name="customer.address.zipCode"]'
        element :input_phone, '[name="customer.phoneNumber"]'
        element :input_ssn, '[name="customer.ssn"]'
        element :input_username_register, '[name="customer.username"]'
        element :input_password_register, '[name="customer.password"]'
        element :input_confirm_password, '[name="repeatedPassword"]'
        element :input_btn_register, 'input[value="Register"]'
        element :span_campo_cadastro_em_branco, '[id="repeatedPassword.errors"]'
        element :span_msg_welcome, '[class*="title"]'
        element :span_user_existent, '[id="customer.username.errors"]'


        def register_user(user)
          input_first_name.set user[:first_name.to_sym]
          input_last_name.set user[:last_name.to_sym]
          input_adress.set user[:address.to_sym]
          input_city.set user[:city.to_sym]
          input_state.set user[:state.to_sym]
          input_zip_code.set user[:zip_code.to_sym]
          input_phone.set user[:phone.to_sym]
          input_ssn.set user[:ssn.to_sym]
          input_username_register.set user[:username.to_sym]
          input_password_register.set user[:password.to_sym]
          input_confirm_password.set user[:confirm_password.to_sym]
          input_btn_register.click
        end

        def register_invalid(user)
          input_first_name.set user["firstname"]
          input_last_name.set user["lastname"]
          input_adress.set user["address"]
          input_city.set user["city"]
          input_state.set user["state"]
          input_zip_code.set user["zipcode"]
          input_phone.set user["phone"]
          input_ssn.set user["ssn"]
          input_username_register.set user["username"]
          input_password_register.set user["password"]
          input_confirm_password.set user["confirmpassword"]
          input_btn_register.click
        end
      end
    end
  end
end
