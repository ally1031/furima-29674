require 'rails_helper'
RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品機能がうまくいくとき' do
      it 'image,title,text,genre_id,status_ah_id,shipping_charges_ah_id,shipment_source_ah_id,shipping_days_ah_id,price,user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

     it 'genre_idが空では登録できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank", "Genre is not a number")
      end

      it 'genre_idで1を選択した場合では登録できない' do
        @item.genre_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre must be other than 1")
      end

      it 'status_ah_idだと登録できない' do
        @item.status_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status ah can't be blank", "Status ah is not a number")
      end

      it 'status_ah_idで1を選択した場合だと登録できない' do
        @item.status_ah_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status ah must be other than 1")
      end

      it 'shipping_charges_ah_idが空では登録できない' do
        @item.shipping_charges_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges ah can't be blank", "Shipping charges ah is not a number")
      end

      it 'shipping_charges_ah_idで1を選択した場合では登録できない' do
        @item.shipping_charges_ah_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges ah must be other than 1")
      end

      it 'shipment_source_ah_idが空では登録できない' do
        @item.shipment_source_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source ah can't be blank", "Shipment source ah is not a number")
      end

      it 'shipment_source_ah_idで1を選択した場合では登録できない' do
        @item.shipment_source_ah_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source ah must be other than 1")
      end

      it 'shipping_days_ah_idが空だと登録できない' do
        @item.shipping_days_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days ah can't be blank", "Shipping days ah is not a number")
      end

      it 'shipping_days_ah_idで1を選択した場合だと登録できない' do
        @item.shipping_days_ah_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days ah must be other than 1")
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥299~¥10,000,000の間でだと登録できない' do
        @item.price = "222"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it '価格は半角数字のみでないと登録できない' do
        @item.price = "５５５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end 
end
