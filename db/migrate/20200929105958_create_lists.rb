class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :title,                  null: false
      t.text    :text,                   null: false
      t.integer :genre_id,               null: false
      t.integer :status_ah_id,           null: false
      t.integer :shipping_charges_ah_id, null: false
      t.integer :shipment_source_ah_id,  null: false
      t.integer :shipping_days_ah_id,    null: false
      t.integer :price,                  null: false
      t.integer :user_id,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
