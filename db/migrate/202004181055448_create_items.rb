class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.text :discription, null: false
      t.integer :price, null:false
      t.references :saler, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }
      t.references :category, foreign_key: true
      t.references :postage, foreign_key: true
      t.references :shipping_date, foreign_key: true
      t.references :condition, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
