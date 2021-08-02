class AddForeignKeyToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :entity_id, :integer
    add_foreign_key :groups, :entities, column: :entity_id
  end
end
