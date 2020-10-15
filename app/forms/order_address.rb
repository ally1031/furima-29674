class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id, :order_id

  validates :municipality, :address, :token, presence: true
  validates :prefectures_id, numericality: { other_than: 1 }, presence: true
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }, presence: true
  validates :phone_number, format: { with: /\A\d{11}\z/ }, presence: true

  def save
    orders = Order.create!(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: orders.id)
  end
end
