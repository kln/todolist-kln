module ApplicationHelper
  def is_a_favorite_list?(list_id, user_id)
    Favorite.where(user_id: user_id, list_id: list_id).present?
  end
end
