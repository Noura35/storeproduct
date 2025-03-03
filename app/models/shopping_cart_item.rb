class ShoppingCartItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product

  validates :quantity, numericality: {greater_than: 0}
end
