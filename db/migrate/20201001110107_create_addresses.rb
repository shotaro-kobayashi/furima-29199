class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code,            null: false
      t.integer :area_id,                null: false
      t.string :city,                    null: false
      t.integer :house_number,           null: false
      t.string :telephone,               null: false
      t.string :house_name           
      t.references :order,               foreign_key: true
      t.timestamps
    end
  end
end
