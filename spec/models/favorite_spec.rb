require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @user = create(:user)
    @list = create(:list, user: @user, opened: true)
    create(:favorite, user: @user, list: @list)
  end

  it "shouldn't allow the user to mark as a favorite the same list" do
    fav = Favorite.create(user_id: @user.id, list_id: @list.id)
    expect(fav.errors.count).to eq(1)
  end

  it "should allow more than one user mark the list as a favorite" do
    user2 = create(:user)
    create(:favorite, list: @list, user: user2)
    expect(@list.favorites.count).to eq(2)
    expect(@list.favorites.last.user).to eq(user2)
  end

  it 'dont favorite private list' do
    list = create(:list, opened: false, user: @user)
    favorite_list = Favorite.new(list: list, user: @user)
    expect{ favorite_list.save! }.to raise_error
  end

end
