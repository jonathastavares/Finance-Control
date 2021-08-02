# frozen_string_literal: true

class AddForeignKeysToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :user_id, :integer
    add_foreign_key :groups, :users, column: :user_id
  end
end
