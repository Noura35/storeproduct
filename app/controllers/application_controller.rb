class ApplicationController < ActionController::Base
  before_action :set_cart_items_count

  private

  def set_cart_items_count
    @cart_items_count = current_user.shopping_cart.shopping_cart_items.count if user_signed_in?
  end
    
end
