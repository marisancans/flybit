class AddDiscountToProducts < ActiveRecord::Migration
  def change
    add_column :products, :discount, :decimal
  end
end
