class Task < ApplicationRecord
  belongs_to :user
  belongs_to :tenant
  validates :name, presence: true
  validates :description, presence: true, allow_blank: true

  def completed
    super.presence || false
  end
end
