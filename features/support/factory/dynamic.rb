require 'faker'
require 'cpf_faker'

module Factory
  class Dynamic
    def self.user
      {
        cpf: Faker::CPF.pretty,
        apelido: Faker::Space.planet,
        nome: "Test Automation #{Faker::Name.first_name}",
        email: "teste.#{Faker::Name.first_name}.#{rand(99)}@mailsac.com",
        celular: "5499999#{rand(9999)}",
        telefone: "543380#{rand(9999)}",
        nascimento: Faker::Date.birthday(min_age: 18, max_age: 65).strftime('%d/%m/%Y'),
        email_valido: "a@a.com",
        senha_valida: "123456",
        nome_valido: "A a"
      }
    end

    def self.valid_user
      {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip_code: Faker::Address.zip_code,
        phone: "11 999888650",
        ssn: rand(99999),
        username: Faker::Name.first_name,
        password: "12345",
        confirm_password: "12345"
      }
    end

    def self.address
      {
        cep: '99010051',
        novo_cep: '59104380',
        cidade: 'Passo Fundo',
        logradouro: 'Rua Coronel Chicuta',
        novo_logradouro: 'Rua Pacatuba',
        numero: '575',
        bairro: 'Centro'
      }
    end

    def self.card(flag)
      case flag
      when 'master'
        {
          numero: '4000000000000010',
          titular: "Test Automation #{Faker::Name.first_name}",
          validade: '1228',
          cvv: '258',
          flag: 'MASTER'
        }
      when 'visa'
        {
          numero: '4000000000000010',
          titular: "Test Automation #{Faker::Name.first_name}",
          validade: '1228',
          cvv: '258',
          flag: 'MASTER'
        }
      else
        raise 'Unsupported flag'
      end
    end
  end
end
