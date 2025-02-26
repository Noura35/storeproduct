class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items,  dependent: :destroy
  has_one :Payment , dependent: :destroy


  #methode pour creer une commande
  def create_order
    
    self.orderDate = Date.today
    self.status="Pending"
    self.totelAmount =calculate_total_amount
    self.save

  end



  #methode pour annuler la commande
  def cancel_order
    self.status="Cancelled"
    self.save
  end


  # Méthode pour suivre la commande (simple exemple)
  def track_order
    "Your order is currently: #{status}"
  end


  private
  # Calculer le montant total de la commande en fonction des items
  def calculate_total_amount
    order_items.sum { |item| item.calculate_total_price }
  end


end
