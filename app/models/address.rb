class Address < ApplicationRecord

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area


  # with_options presence:true do
  #   validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: '正しく入力してください' }
  #   validates :area_id
  #   validates :city
  #   validates :house_number
  #   validates :telephone  ,format: { with: /[\d]{9,11}/i, message: "正しく入力してください" }
  #   validates :order_id
  # end
end
