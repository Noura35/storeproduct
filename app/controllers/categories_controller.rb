class CategoriesController < ApplicationController
 


    def show
      @category = Category.find(params[:id])
    
      # If a category has a parent_id, it's considered a subcategory
      if params[:subcategory_id]
        @subcategory = Category.find(params[:subcategory_id])
        @products = @subcategory.products
      else
        @products = @category.products
      end
    end
  


end
