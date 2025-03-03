class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_order, only: [:show]
  
    def new
      @shopping_cart = current_user.shopping_cart
      if @shopping_cart.shopping_cart_items.empty?
        redirect_to shopping_cart_path, alert: 'Your cart is empty!'
      else
        @order = current_user.orders.build
        @order_items = @shopping_cart.shopping_cart_items
      end
    end
  
    def create
      @shopping_cart = current_user.shopping_cart
      @order = current_user.orders.build(order_params)
  
      @shopping_cart.shopping_cart_items.each do |item|
        @order.order_items.build(product: item.product, quantity: item.quantity)
      end
  
      if @order.save
        @shopping_cart.shopping_cart_items.destroy_all
        redirect_to order_path(@order), notice: 'Order successfully placed.'
      else
        render :new
      end
    end
  
    # Adding the show action
    def show
      # @order is already set by the before_action :set_order
      @order_items = @order.order_items
    end
  
    private
  
    # DRY method to find the order for actions like show
    def set_order
      @order = current_user.orders.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: 'Order not found.'
    end
  
    # Strong parameters for order
    def order_params
      params.require(:order).permit(:status)  # Add any other parameters you need
    end
  end
  