class List < ActiveRecord::Base
	has_many :tasks, dependent: :destroy
  has_many :favorites
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true

  scope :ordered, -> { order('created_at ASC') }
  scope :publics, -> { where(opened: true).order('created_at DESC') }
  scope :last_public_lists, -> { publics.limit(3) }
end
