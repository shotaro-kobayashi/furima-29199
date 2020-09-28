class Product < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_cost

  

  validates :product_name,:text,:category,:status,:price,:area,:day,:delivery_cost,:image, presence:true
  validates :price, format: {with: /\A[0-9]+\z/, message: "は半角数字で入力してください"}
  validates :price, inclusion: {in: 300..9999999 }

  validates :category_id,:area_id,:status_id,:delivery_cost_id,:day_id, numericality: { other_than: 1 } ,allow_nil: true

  
end
