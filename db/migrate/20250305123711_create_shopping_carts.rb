class CreateShoppingCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_carts do |t|
      t.string :name

      t.timestamps
    end
  end
end
