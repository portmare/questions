# spec/support/features/session_helpers.rb
module Features
  module SessionHelpers
    def sign_up(**attrs)
      visit new_user_registration_path
      fill_in 'user_name', with: attrs["name"]
      fill_in 'user_email', with: attrs["email"]
      fill_in 'user_password', with: attrs["password"]
      fill_in 'user_password_confirmation', with: attrs["password_confirmation"]
      click_button 'Зарегистрироваться'
    end

    def logged_in(email, password)
      visit new_user_session_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'Войти'
    end
  end
end