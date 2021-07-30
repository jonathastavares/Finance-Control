class RemoveEntityIdFromGroups < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :groups, :entities, column: :entity_id
    remove_column :groups, :entity_id, :integer
    remove_foreign_key :entities, :groups, column: :group_id
  end
end
