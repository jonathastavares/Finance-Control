class Entity < ApplicationRecord
  has_one :user
  has_many :groups
  validates :amount, presence: true
  validates :name, presence: true
end
