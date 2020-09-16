class PostsController < ApplicationController

    def index
      @products = Product.all
    end

    def new
    end

  
end
