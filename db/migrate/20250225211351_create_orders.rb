class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.date :orderDate
      t.string :status
      t.float :totalAmount
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
