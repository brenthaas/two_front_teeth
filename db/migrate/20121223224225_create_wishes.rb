class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.references :user
      t.string :name, :null => false
      t.text :description
      t.string :link
      t.decimal :price, :default => 0, :null => false
      t.boolean :granted

      t.timestamps
    end
    add_index :wishes, :name
    add_index :wishes, :price
  end
end
