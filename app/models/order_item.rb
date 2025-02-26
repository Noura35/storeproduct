class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order


  #calculer su prix total pour ce item de command 

  def calculate_total_price
       self.quantity * self.price
  end


end
