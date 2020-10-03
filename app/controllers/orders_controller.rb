class OrdersController < ApplicationController
  def index
    # @orders = Product.all
    @product = Product.find(params[:product_id])
    @order = OrderAddress.new
  end

  def transaction
    @product = Product.find(params[:id])
    if current_user.id  == @product.user_id || @product.orders.length >= 1
      redirect_to root_path
    end
      @address =  Address.new
  end

  def create
    @product = Product.find(params[:product_id])
    #@order = Order.create(user_id: current_user.id, product_id: params[:id])
    #@address = @order.build_address(address_params)
    #p @address
    #if @address.save
      #redirect_to root_path
    #else
      #render :orders
    #end
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end