class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :house_number, :house_name, :telephone, :token,:order_id, :user_id, :product_id

  with_options presence:true do
    validates :postal_code,format: { with: /\A\d{3}[-]\d{4}\z/, message: '正しく入力してください' } 
    validates :area_id
    validates :city
    validates :house_number
    validates :telephone  ,format: { with: /[\d]{9,11}/i, message: "正しく入力してください" }
    #validates :order_id
    validates :token
  end

  def save
    # 購入情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, product_id: product_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, city: city, house_number: house_number,order_id: order.id,area_id: area_id,telephone: telephone,house_name: house_name)
    # 寄付金の情報を保存
    #Donation.create(price: price, user_id: user.id)
  end





end