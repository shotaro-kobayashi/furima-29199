require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入者情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'area_idが空だと保存できないこと' do
      @order_address.area_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'telephoneが空だと保存できないこと' do
      @order_address.telephone = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
    end
    it 'tokenが空だと保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '77777777'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code 正しく入力してください")
    end
    it 'telephoneが11桁以内の正しい形式でないと保存できないこと' do
      @order_address.telephone = '999'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone 正しく入力してください")
    end
    it 'telephoneにハイフンは不要であること' do
      @order_address.telephone = '090-9999-8888'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Telephone 正しく入力してください")
    end
    it 'house_nameは空でも保存できること' do
      @order_address.house_name = ''
      expect(@order_address).to be_valid
    end
  end
end