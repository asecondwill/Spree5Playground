class Purchaseorders < ActiveRecord::Migration[7.2]
  def change
    add_column :spree_payments, :purchase_order_number, :string
    create_table :spree_purchase_orders do |t|
      t.string :purchase_order_number
      t.integer :user_id
      t.string :organization_name
      t.timestamps null: true
    end
    add_index :spree_purchase_orders, :user_id
  end
end
