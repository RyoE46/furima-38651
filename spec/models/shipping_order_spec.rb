require 'rails_helper'

RSpec.describe ShippingOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shipping_order = FactoryBot.build(:shipping_order, user_id: user.id, item_id: item.id)
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@shipping_order).to be_valid
      end
      it 'buildingは空でも保存できる' do
        building = ''
        expect(@shipping_order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'tokenが空だと保存できない' do
        @shipping_order.token = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Token can't be blank"
      end
      it 'post_codeが空だと保存できない' do
        @shipping_order.post_code = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeが「3桁 - 4桁]の半角文字列でないと保存できない' do
        @shipping_order.post_code = '1234567'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include 'Post code is invalid. Include hyphen(-)'
      end
      it 'area_idを選択していないと保存できない' do
        @shipping_order.area_id = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idは2~48以外だと保存できない' do
        @shipping_order.area_id = '1'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空だと保存できない' do
        @shipping_order.city = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "City can't be blank"
      end
      it 'addresが空だと保存できない' do
        @shipping_order.addres = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Addres can't be blank"
      end
      it 'phone_numberが空だと保存できない' do
        @shipping_order.phone_number = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは半角数字以外だと保存できない' do
        @shipping_order.phone_number = 'ghfghjhfgh'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは9桁以下だと保存できない' do
        @shipping_order.phone_number = '12345678'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'phone_numberは12桁以上だと保存できない' do
        @shipping_order.phone_number = '566543357864534676545'
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include 'Phone number is invalid'
      end
      it 'userが紐付いていないと保存できない' do
        @shipping_order.user_id = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できない' do
        @shipping_order.item_id = ''
        @shipping_order.valid?
        expect(@shipping_order.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
