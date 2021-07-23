# frozen_string_literal: true

class User < ApplicationRecord
  has_many :entities, dependent: :destroy
  has_many :groups
  has_many :external_transactions, -> { where group_id: nil }, class_name: 'Entity'
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 25 }
end
