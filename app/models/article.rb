class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre, :status_ah, :shipping_charges_ah, :shipment_source_ah, :shipping_days_ah

  validates :title, :text, :price, presence: true
  validates :genre_id, :status_ah_id, :shipping_charges_ah_id, :shipment_source_ah_id, :shipping_days_ah_id numericality: { other_than: 1 } 
end
