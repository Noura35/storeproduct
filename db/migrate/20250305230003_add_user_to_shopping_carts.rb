class AddUserToShoppingCarts < ActiveRecord::Migration[7.1]
  def change
    add_reference :shopping_carts, :user, null: false, foreign_key: true
  end
end
