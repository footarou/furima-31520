require 'rails_helper'

RSpec.describe ShopperInfo, type: :model do
  before do
    @item =  FactoryBot.create(:item)
    @user =  FactoryBot.create(:user)
    @order = FactoryBot.build(:shopper_info, item_id: @item.id, user_id: @user.id)
    sleep 1
  end

  describe '商品購入機能' do
    context '商品出品がうまくいくとき' do
      it "priceとtokenがあれば保存ができること" do
        expect(@order).to be_valid
      end
      it "建物名が未入力でも購入できること" do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "郵便番号が空では登録できないこと" do
        @order.zip_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code can't be blank")
      end

      it "都道府県が「--」(id:1)では登録できないこと" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "市区町村が空では登録できないこと" do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it "番地が空では登録できないこと" do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it "電話番号が空では登録できないこと" do
        @order.phone_no = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone no can't be blank")
      end

      it "郵便番号にハイフンがないと登録できないこと" do
        @order.zip_code = "1111000"
        @order.valid?
        expect(@order.errors.full_messages).to include("Zip code is invalid")
      end

      it "電話番号にハイフンがあると登録できないこと" do
        @order.phone_no = "12-345-6789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone no is invalid")
      end

      it "ユーザーのidが存在しない場合、購入できないこと" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end      

      it "商品のidが存在しない場合、購入できないこと" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end

      it "電話番号は12桁以上では登録できないこと" do
        @order.phone_no = "012345678901"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone no is invalid")
      end

      it "電話番号は英数混合では登録できないこと" do
        @order.phone_no = "1a2b3c45678"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone no is invalid")
      end
    end
  end    
end
