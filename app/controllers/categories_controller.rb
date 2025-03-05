class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/:id
  def show
    @subcategories = @category.subcategories
    @products = @category.products
  end

  private

  # Set the category based on params[:id]
  def set_category
    @category = Category.find(params[:id])
  end
end
