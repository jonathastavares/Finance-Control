class User < ApplicationRecord
  has_many :entities, dependent: :destroy
  has_many :groups
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end
