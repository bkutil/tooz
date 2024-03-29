class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.text :description
      t.integer :price, null: false

      t.timestamps
    end
  end
end
