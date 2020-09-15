class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :order_detail_id
      t.integer :total_price
      t.integer :shipping_cost
      t.integer :status
      t.integer :payment
      t.string :postal_code
      t.string :address
      t.string :name

      t.timestamps
    end
  end
end
