class Entity < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :group, class_name: 'Group', foreign_key: 'group_id'
  has_many :groups
  validates :amount, presence: true
  validates :name, presence: true
end
