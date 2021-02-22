require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できない時' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーの情報がid:1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category select'
      end

      it '商品の状態の情報がid:1だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status select'
      end

      it '配送料の負担についての情報がid:1だと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee select'
      end

      it '発送元の地域の情報がid:1だと登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping area select'
      end

      it '発送までの日数がid:1だと登録できない' do
        @item.shippment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shippment select'
      end

      it '販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格が300円未満だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '販売価格が10000000以上の場合登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it '販売価格が全角数字だと登録できない' do
        @item.price = '１２２２０'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '販売価格が全角文字だと登録できない' do
        @item.price = 'Ｔｅｓｕｔｏ'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '販売価格が半角英数混合だと登録できない' do
        @item.price = 'test1234'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it 'ユーザーが紐づいてなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end

    context '出品できる時' do
      it '必要な情報を適切に入力すると、商品情報が登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
