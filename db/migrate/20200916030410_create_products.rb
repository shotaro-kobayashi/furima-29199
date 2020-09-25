class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :product_name, null: false
      t.string :text,                    foreign_key: true
      t.text :image,                     null: false
      t.integer :price,                  foreign_key: true
      t.integer :user_id,                foreign_key: true
      t.integer :category_id,            null: false
      t.integer :status_id,              null: false
      t.integer :delivery_cost_id,       null: false
      t.integer :area_id,                null: false
      t.integer :days_id,                null: false
      t.timestamps
    end
  end
end
