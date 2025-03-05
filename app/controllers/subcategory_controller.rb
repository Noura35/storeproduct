class SubcategoryController < ApplicationController
  before_action :set_category, only: [:show]
  before_action :set_subcategory, only: [:show]

  def show
    @products = @subcategory.products
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_subcategory
    @subcategory = @category.subcategories.find(params[:id])
  end
end
