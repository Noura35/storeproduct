

class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_subcategories, only: [:edit, :new]


def index
  @products =Product.all
end


  def new
    @product = Product.new
  end

  def edit
  end

  def show
    @category = @product.category  # Récupérer la catégorie associée
    @subcategory = @product.subcategory  # Récupérer la sous-catégorie associée, si elle existe
  end
  

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @product.destroy
    redirect_to products_path  
  end 


  def subcategories
    category = Category.find(params[:category_id])
    subcategories = category.subcategories
    render json: { subcategories: subcategories }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.where(parent_id: nil) # Categories principales
  end

  def set_subcategories
      @subcategories = Category.where.not(parent_id: nil) || []  # Récupérer toutes les sous-catégories
  end

  def product_params
    params.require(:product).permit(:name, :description,:price, :image ,:category_id,:subcategory_id)
  end
end
