class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create,:transaction,:create_transaction]
  before_action :set_product, only: [:edit, :show,:update,:destroy,:transaction]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      redirect_to action: :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      redirect_to action: :show
    end
  end
  

  private

  def product_params      
    params.require(:product).permit(:product_name, :text, :category_id,:area_id,:day_id,:status_id,:delivery_cost_id,:price,:image).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:postal_code, :city, :area_id, :house_number, :telephone, :house_name)#.merge(user_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end

end
