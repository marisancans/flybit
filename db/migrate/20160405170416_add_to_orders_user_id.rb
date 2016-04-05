class AddToOrdersUserId < ActiveRecord::Migration
  def change
  	add_column :orders, :user_id, :integer, default:0
  end
end
