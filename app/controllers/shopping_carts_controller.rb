class ShoppingCartsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_cart


  def show
    @items =@shopping_cart.shopping_cart_items.includes(:product)
  end


  private 
  def set_cart
      @shopping_cart= current_user.shopping_cart || current_user.create_shopping_cart
  end
end
