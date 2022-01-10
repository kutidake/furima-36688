require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品管理機能' do
    context '出品できる場合' do
      it '全ての値が正しく入力されていれば出品できること' do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "imageが空では作成できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では作成できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "商品の説明が空では作成できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーが未選択では作成できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が未選択では作成できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が未選択では作成できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it "発送元の地域が未選択では作成できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "発送までの日数が未選択では作成できない" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "価格が300円未満では出品できない" do
        @item.price = '111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が9_999_999円を超えると出品できいない" do
        @item.price = '9999999999999'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "価格に半角数字以外が含まれている場合は出品できない" do
        @item.price = '12AASI'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end