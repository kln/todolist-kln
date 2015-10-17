class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates_uniqueness_of :user_id, :scope => [:user_id, :list_id], message: "A Lista já está marcada como favorita."
  validates_presence_of :list_id

  validate :list_must_be_public


  def list_must_be_public
    unless list.opened?
      errors.add(:base)
    end
  end

end
