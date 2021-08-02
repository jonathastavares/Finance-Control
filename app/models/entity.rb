class Entity < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :relations, dependent: :destroy
  has_many :groups, through: :relations
  validates :amount, presence: true
  validates :name, presence: true
end
