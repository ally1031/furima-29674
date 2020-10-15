require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @seller = FactoryBot.create(:user)
    @buyer  = FactoryBot.create(:user)
    @item   = FactoryBot.create(:item, user_id: @seller.id)
    @order_address = FactoryBot.build(:order_address, user_id: @buyer.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品購入機能がうまくいくとき' do
      it ':postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :token, :user_id, :item_id, :order_address_idが存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
    end

    context '商品購入機能がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid', "Postal code can't be blank")
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @order_address.postal_code = '3333333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefectures_idが空では登録できない' do
        @order_address.prefectures_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefectures is not a number', "Prefectures can't be blank")
      end

      it 'prefectures_idが１だと登録できない' do
        @order_address.prefectures_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefectures must be other than 1')
      end

      it 'municipalityが空では登録できない' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では登録できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid', "Phone number can't be blank")
      end

      it 'phone_numberが11桁以上だと登録できない' do
        @order_address.phone_number = '037448367535353'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
