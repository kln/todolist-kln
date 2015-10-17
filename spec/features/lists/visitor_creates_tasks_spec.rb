require 'rails_helper'

feature 'Visitor can creates many tasks' do

  scenario 'with valid actions' do
    new_list_page
    fill_in "list_title", with: "Programming languages to learn"
    click_on "save-list"

    expect(page).to have_content("Programming languages to learn")
    expect(page).to have_css("img[title='Privada']")
    expect(@user.lists.last.opened).to be false

    fill_in "task_description", with: "Ruby"
    click_on "save-task"

    fill_in "task_description", with: "Elixir"
    click_on "save-task"

    expect(page).to have_content("Ruby")
    expect(page).to have_content("Elixir")

    expect(@user.lists.last.tasks.count).to eq(2)
  end

  scenario 'with title blank' do
    new_list_page
    fill_in "list_title", with: ""
    click_on "save-list"
    expect(page).to have_content("O título da lista não pode ficar em branco")
  end

  def new_list_page
    @user = create(:user)
    sign_in_with(@user.email, @user.password)
    click_on("new-list")
  end
end