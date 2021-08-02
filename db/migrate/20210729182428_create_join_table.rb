class CreateJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|
      t.references :entity, index: true, foreign_key: true
      t.references :group, index: true, foreign_key: true
    end
  end
end
