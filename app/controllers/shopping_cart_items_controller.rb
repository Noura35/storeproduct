class ShoppingCartItemsController < ApplicationController
  
  before_action :set_cart
  
    
  
  def create
    # Cherche si l'item existe déjà dans le panier
    @item = @shopping_cart.shopping_cart_items.find_by(product_id: params[:product_id])

    if @item
      # Si l'item existe déjà, on met à jour la quantité
      @item.quantity += params[:quantity].to_i
    else
      # Sinon, on crée un nouvel item dans le panier
      @item = @shopping_cart.shopping_cart_items.new(product_id: params[:product_id], quantity: params[:quantity])
    end

    if @item.save
      redirect_to shopping_cart_path(@shopping_cart), notice: 'Product added to cart successfully.'
    else
      redirect_to products_path, alert: 'Unable to add product to cart.'
    end
  end




  def update
    @shopping_cart_item = @shopping_cart.shopping_cart_items.find(params[:id])

    if @shopping_cart_item.update(shopping_cart_item_params)
      redirect_to shopping_cart_path, notice: 'Cart updated successfully.'
    else
      redirect_to shopping_cart_path, alert: 'Unable to update cart.'
    end
  end



  

  def destroy
    @shopping_cart_item = @shopping_cart.shopping_cart_items.find(params[:id])
    @shopping_cart_item.destroy
    redirect_to shopping_cart_path(@shopping_cart), notice: 'Product removed from cart.'
  end



  def remove
    @shopping_cart_item = @shopping_cart.shopping_cart_items.find(params[:id])
    @shopping_cart_item.destroy
    redirect_to shopping_cart_path, notice: 'Product removed from cart.'
  end

  


  private 
  def set_cart
    @shopping_cart = current_user.shopping_cart || current_user.create_shopping_cart
  end

  def shopping_cart_item_params
    params.require(:shopping_cart_item).permit(:product_id, :quantity)
  end

 

end
