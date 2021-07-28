class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :entities
  has_one_attached :image, dependent: :destroy
  validates :name, presence: true
end
