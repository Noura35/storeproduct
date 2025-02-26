class Payment < ApplicationRecord
  belongs_to :order
  


  # Méthode pour effectuer un paiement
  def make_payment(amount)
    self.amount = amount
    self.paymentDate = Date.today
    self.save
  end


end
