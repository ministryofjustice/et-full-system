module EtFullSystem
  module Test
    module Admin
      class LoginPage < Admin::BasePage
        set_url "/login"
        element :email_field, :field, 'Username*'
        element :password_field, :field, 'Password*'
        element :login_button, 'input[value=Login]'

        def login(email:, password:)
          email_field.set(email)
          password_field.set(password)
          login_button.click
        end
      end
    end
  end
end