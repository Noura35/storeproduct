class ShoppingCart < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy


  # Ajouter un produit au panier
  def add_to_cart(product, quantity = 1)
    order_item = order_items.find_or_initialize_by(product: product)
    order_item.quantity += quantity
    order_item.price = product.price
    order_item.save
  end

  # Retirer un produit du panier
  def remove_from_cart(product)
    order_item = order_items.find_by(product: product)
    order_item&.destroy
  end

  # Vider le panier
  def clear_cart
    order_items.destroy_all
  end

  # Passer à la caisse (checkout)
  def checkout
    order = user.orders.create
    order_items.each do |item|
      order.order_items << item
    end
    clear_cart
    order.create_order
  end

end
