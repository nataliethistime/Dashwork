class Tenant < ApplicationRecord
  has_many :users
  validates :name, presence: true, length: { minimum: 3 }
end
