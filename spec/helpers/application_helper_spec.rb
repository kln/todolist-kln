require 'rails_helper'

describe 'ApplicationHelpers' do
  describe "#is_a_favorite_list?" do
    before do
      @user = create(:user)
      @list = create(:list, user: @user, opened: true)
      create(:favorite, user: @user, list: @list)
    end

    it 'should return true' do
      result = helper.is_a_favorite_list?(@list.id, @user.id)
      expect(result).to be
    end

    it 'should return false' do
      result = helper.is_a_favorite_list?(3, @user.id)
      expect(result).to_not be
    end
  end
end
