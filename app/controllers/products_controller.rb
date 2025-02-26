class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product=Product.find (params[:id])   
  end

  def new
    @product=Product.new
  end

  def edit
    @product=Product.find(params[:id])
  end

  def update  
    @product=Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end







  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to products_path  , notice: 'product was successfully created'
    else
      render :new
    end

  end 





  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to products_path  
  end 

  private
  def product_params 
    params.require(:product).permit(:name, :description,:price,:quantity, :category_id)
  end

end
