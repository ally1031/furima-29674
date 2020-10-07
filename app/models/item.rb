class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status_ah
  belongs_to_active_hash :shipping_charges_ah
  belongs_to_active_hash :shipment_source_ah
  belongs_to_active_hash :shipping_days_ah

  validates :image, :title, :text, :genre_id, :status_ah_id, :shipping_charges_ah_id, :shipment_source_ah_id, :shipping_days_ah_id, :price, presence: true
  validates :genre_id, :status_ah_id, :shipping_charges_ah_id, :shipment_source_ah_id, :shipping_days_ah_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than: 300, less_than: 9_999_999 }, format: { with: /\A(?=.*?[\d])[\d]+\z/i.freeze }
end
