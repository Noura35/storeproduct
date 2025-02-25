class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.float :amount
      t.date :paymentDate
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
