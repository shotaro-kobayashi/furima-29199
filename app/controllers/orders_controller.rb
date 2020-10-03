class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


private

  def order_params
    params.require(:order_address).permit(:postal_code,:area_id,:city,:house_number,:telephone,:house_name).merge(token: params[:token],user_id: current_user.id,product_id: @product.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @product.price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
  
end