require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
       it 'name,memo,category_id,condition_id,price,days_to_ship_id,shipping_fee_id,ship_from_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'memoが空だと登録できない' do
        @item.memo = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Memo can't be blank")
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'condition_idが1だと登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is invalid. Input half-width numbers.")
      end
      it 'priceが299円以下空だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが10,000,000円以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it 'priceが全角数字だと登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship must be other than 1")
      end
      it 'shipping_fee_idが1だと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
      end
      it 'ship_from_idが1だと登録できない' do
        @item.ship_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship from must be other than 1")
      end
    end
  end
end


# ログイン状態のユーザーだけが、商品出品ページへ遷移できること

# ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること

# 商品画像を1枚つけることが必須であること
# 商品名が必須であること
# 商品の説明が必須であること
# カテゴリーの情報が必須であること
# 商品の状態についての情報が必須であること
# 配送料の負担についての情報が必須であること
# 発送元の地域についての情報が必須であること
# 発送までの日数についての情報が必須であること
# 価格についての情報が必須であること
# 価格の範囲が、¥300~¥9,999,999の間であること
# 販売価格は半角数字のみ保存可能であること
# 入力された販売価格によって、販売手数料や販売利益の表示が変わること
# 必要な情報を適切に入力すると、商品の出品ができること
# エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）
# 入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること