# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[6.1]
  def change
    create_table :entities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.float :amount
      t.timestamps
    end
  end
end
