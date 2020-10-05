class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  #validates :image, :title, :text, :category_id, :status_id, :shipping_charges_id, :shipment_source_id, :shipping_days_id, :price, precence: true
  
end
