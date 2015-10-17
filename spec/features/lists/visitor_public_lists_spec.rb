require 'rails_helper'

feature 'Public lists' do
  before do
    @public_list = create(:list, opened: true, user: create(:user))
    @user = create(:user)
    sign_in_with(@user.email, @user.password)
  end

  scenario 'Visitor can see all public lists' do
    click_on("new-list")
    fill_in "list_title", with: "Programming languages to learn"
    check 'list_opened'
    click_on "save-list"

    visit public_lists_path

    expect(page).to have_content(@public_list.title)
    expect(page).to have_content("Programming languages to learn")

    page.has_css?("row list-item", :count => 2)
  end

  scenario 'Visitor can check list as a favorite' do
    visit public_lists_path
    click_on "fav-list"
    expect(@user.favorites.last.list.title).to eq(@public_list.title)
  end

  scenario 'Visitor can delete a list from favorite list' do
    create(:favorite, user: @user, list: @public_list)

    visit public_lists_path
    click_on "unfav-list"
    expect(@user.favorites.count).to eq(0)
  end


end