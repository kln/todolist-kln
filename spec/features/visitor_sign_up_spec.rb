require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'user@email.com', 'password'
    expect(page).to have_content('Sair')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'
    expect(page).to have_content('Por favor, corrija os erros abaixo')
  end
end