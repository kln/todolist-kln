class Task < ActiveRecord::Base
  belongs_to :list
  validates :description, presence: true

  def completed?
  	finished_at.present?
  end
end