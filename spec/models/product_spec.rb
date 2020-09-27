require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品情報登録' do
    context '登録がうまくいかないとき' do
      it "商品名が空では登録できない" do
        @product.product_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end

      it "説明文が空では登録できない" do
        @product.text = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end

      it "カテゴリーidが空では登録できない" do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it "値段が空では登録できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it "値段は半角数字でなくてはならない" do
        @product.price = "!"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it "値段は¥300~¥9,999,999の間でなくてはならない" do
        @product.price = "100"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not included in the list")
      end

      it "ステータスidが空では登録できない" do
        @product.status_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it "エリアidが空では登録できない" do
        @product.area_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end

      it "デリバリーコストidが空では登録できない" do
        @product.delivery_cost_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery cost can't be blank")
      end

      it "デイidが空では登録できない" do
        @product.day_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Day can't be blank")
      end

      it "ユーザーが空では登録できない" do
        @product.user_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end

    end

    context '登録がうまくいくとき' do
      it "情報を全て入力すれば登録できる" do
        expect(@product).to be_valid
        binding.pry
      end
      it "値段は¥300~¥9,999,999の間であれば登録できる" do
        @product.price = "500"
        expect(@product).to be_valid
      end
    end
  end
end