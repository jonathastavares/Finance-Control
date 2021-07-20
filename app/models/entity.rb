class Entity < ApplicationRecord
  has_one :user
  has_many :groups
end
