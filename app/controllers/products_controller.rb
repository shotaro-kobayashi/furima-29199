class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new,:create]
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
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
   @product = Product.find(params[:id])
    
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      redirect_to action: :edit
    end
    
    end
  


  private

  def product_params      
    params.require(:product).permit(:product_name, :text, :category_id,:area_id,:day_id,:status_id,:delivery_cost_id,:price,:image).merge(user_id: current_user.id)
  end
  

end
