require 'rails_helper'

feature 'favorite lists' do
  let(:user) { create(:user) }

  scenario 'show favorite lists' do
    list = create(:list, user: user)
    fav_list = create(:list, user_id: 100, opened: true)
    Favorite.create(user_id: user.id, list_id: fav_list.id)

    sign_in_with(user.email, user.password)

    click_on("user_favorites")

    expect(page).to have_content('Minhas Listas Favoritas')

    expect(page).to have_css("img[title='Remover dos favoritos']")

    expect(page).to have_content(fav_list.title)
    expect(page).to_not have_content(list.title)
  end

end