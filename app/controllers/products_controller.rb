class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  def index
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def create
    @products = Product.create(product_params)
    # @users = @products.users.new(user_params)
    @products.save
    if @products.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def product_params      
    params.require(:product).permit(:product_name, :text, :category_id,:area_id,:day_id,:status_id,:delivery_cost_id,:price,:image).merge(user_id: current_user.id)
  end

end
