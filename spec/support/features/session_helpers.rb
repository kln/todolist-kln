module Features
  module SessionHelpers
    def sign_up_with(email, password)
      visit '/users/sign_up'
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      fill_in 'user_password_confirmation', with: password
      click_button 'create-account'
    end

    def sign_in_with(email, password)
      visit root_path
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
      click_button 'user_login'
    end
  end
end