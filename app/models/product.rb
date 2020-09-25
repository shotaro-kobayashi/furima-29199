class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :status
  belongs_to_active_hash :day
  belongs_to_active_hash :delivery_cost

  has_one_attached :image

  validates :product_name,:text,:category,:status,:price,:area,:days,:delivery_cost,:image, presence:true

  validates :category_id,:area_id,:status,:delivery_cost,:days, numericality: { other_than: 1 } 
end
