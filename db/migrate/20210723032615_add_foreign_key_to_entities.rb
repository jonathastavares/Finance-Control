class AddForeignKeyToEntities < ActiveRecord::Migration[6.1]
  def change
    add_column :entities, :group_id, :integer
    add_foreign_key :entities, :groups, column: :group_id
  end
end
