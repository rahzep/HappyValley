class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :item_type, :null => false
      t.integer :item_id, :null => false
      t.string :operation, :null => false
      t.string :operator
      t.text :object

      t.timestamps
    end
    add_index :versions, [:item_type, :item_id]

  end
end
