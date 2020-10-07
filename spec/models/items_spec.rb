require 'rails_helper'

RSpec.describe Items, type: :model do
  describe '商品出品機能'　do
    
    context '商品出品機能がうまくいくとき' do
      it 'image,title,text,genre_id,status_ah_id,shipping_charges_ah_id,shipment_source_ah_id,shipping_days_ah_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品機能がうまくいかないとき' do
      it 'imageが空だと登録できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '画像は一枚でないと登録できない'　do
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
        expect(@item.errors.full_messages).to include("Genre_id can't be blank")
      end

      it 'status_ah_idが空だと登録できない' do
        @item.status_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status_ah_id can't be blank")
      end

      it 'shipping_charges_ah_idが空では登録できない' do
        @item.shipping_charges_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_charges_ah_id can't be blank")
      end

      it 'shipment_source_ah_idが空では登録できない' do
        @item.shipment_source_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment_source_ah_id can't be blank")
      end

      it 'shipping_days_ah_idが空だと登録できない' do
        @item.shipping_days_ah_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping_days_ah_id can't be blank")
      end

      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格の範囲が、¥300~¥9,999,999の間でだと登録できない' do
        @item.price = '555'
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end

      it '価格は半角数字のみでないと登録できない' do
        @item.price = '555'
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end

      it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = 'csxs'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name = 'sjbd'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
    end
  end 
end
