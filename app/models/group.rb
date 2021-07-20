class Group < ApplicationRecord
  has_one :user
  has_many :entities
end
