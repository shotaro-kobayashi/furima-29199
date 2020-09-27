class PostsController < ApplicationController 
  before_action :authenticate_user!, only:[:new]
  
    def index
      @products = Product.all
    end
    
    def new
      @products = Product.new
    end

    def create
      Product.create(product_params)
    end

  
    private

    def product_params      
      params.require(:product).permit(:product_name, :image, :text, :category_id,:area_id,:days_id,:status_id,:delivery_cost_id)
    end

  
end
