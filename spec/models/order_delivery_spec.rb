require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    @order_delivery = FactoryBot.build(:order_delivery)
  end

  describe '商品購入' do
    context '購入できる時' do
      it '全ての情報が正しく入力されている時購入できる' do
        expect(@order_delivery).to be_valid
      end

      it 'address_line2が空の場合でも登録できる' do
        @order_delivery.address_line2 = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '購入できない時' do
      it 'トークンが空のとき登録できない' do
        @order_delivery.token = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号が空の時購入できない' do
        @order_delivery.postal_cord = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Postal cord can't be blank"
      end

      it '都道府県情報がid:1の時購入できない' do
        @order_delivery.shipping_area_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include 'Shipping area select'
      end

      it 'address_line1が空の時購入できない' do
        @order_delivery.address_line1 = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Address line1 can't be blank"
      end
      it '電話番号が空の時購入できない' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号に-が入っている時購入できない' do
        @order_delivery.phone_number = 223 - 1122
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include 'Phone number is invalid'
      end

      it '電話番号に全角数字が含まれると購入できない' do
        @order_delivery.phone_number = '０８０１223312'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include 'Phone number is invalid'
      end

      it '郵便番号に-が入っていないと購入できない' do
        @order_delivery.postal_cord = '2232233'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include 'Postal cord is invalid. Include hyphen(-)'
      end

      it '郵便番号に全角数字が含まれると購入できない' do
        @order_delivery.postal_cord = '１１２-2233'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include 'Postal cord is invalid. Include hyphen(-)'
      end
    end
  end
end
