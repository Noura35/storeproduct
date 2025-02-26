class OrdersController < ApplicationController

    before_action :set_order, only: [:show,:edit,:update,:destroy]

    
    
    def index
        @orders=Order.all
    end


    def show
    end

    def edit
    end

    def new
        @order = Order.new
    end



    def create
        @order =Order.new(order_params)

        if @order.save

            redirect_to @order, notice: "order was successfully created."

        else
            render :new
            
        end
        

    end


    def update
        if @order.update(order_params)
            redirect_to @order , notice:"order was successfully updated."            
        else
            render :edit
        end

    end


        
    def destroy
        @order.destroy
        redirect_to orders_path,notice: "order was successfully destroyed!"
    end



    private

    def set_order
        @order =Order.find(params[:id])

    end



    def  order_params
        params.require(:order).permit(:status,:orderDate,:totalAmount,:user_email)
    end

end
