class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      t.string :title,                null: false
      t.text :text,                   null: false
      t.integer :category_id,         null: false
      t.integer :status_id,           null: false
      t.integer :shipping_charges_id, null: false
      t.integer :shipment_source_id,  null: false
      t.integer :shipping_days_id,    null: false
      t.integer :price,               null: false
      t.integer :user_id,             null: false
      t.timestamps
    end
  end
end
