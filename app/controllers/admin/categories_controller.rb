class Admin::CategoriesController < ApplicationController
    http_basic_authenticate_with name: ENV["HTTP_USERNAME"],
    password: ENV["HTTP_PASSWORD"]
  
    def create
        @category = Category.new(category_params)
    
        if @category.save
          redirect_to [:admin, :categories], notice: "A new category is created!"
        else
          render :new
        end
    end
    
    def new
        @category = Category.new
    end
    
    def index
        @categories = Category.all
    end
    
    private
    
    def category_params
        params.require(:category).permit(:name)
    end
end
