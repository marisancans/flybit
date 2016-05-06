class AddOrdersCountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :orders_count, :integer
  end
end
