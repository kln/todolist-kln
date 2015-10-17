require 'rails_helper'

feature 'Visitor login' do
  scenario 'with valid email and password' do
    user = create(:user)
    sign_in_with user.email, user.password
    expect(page).to have_content('Sair')
    expect(page).to have_content("Olá, #{user.email}")
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'
    expect(page).to have_content(' Por favor, corrija os erros abaixo')
  end
end