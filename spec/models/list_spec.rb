require 'rails_helper'

RSpec.describe List, type: :model do
  it 'should be invalid without a title' do
    list = build(:list, title: nil)
    expect(list).to be_invalid
  end

  it 'must be private by default' do
    user = create(:user)
    list = user.lists.create(title: "Lorem Lorem")
    expect(list).to be_valid
    expect(list.opened).to be false
  end
end
