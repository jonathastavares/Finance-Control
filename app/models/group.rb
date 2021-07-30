class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :relations, dependent: :destroy
  has_many :entities, through: :relations
  has_one_attached :image, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: true }
end
