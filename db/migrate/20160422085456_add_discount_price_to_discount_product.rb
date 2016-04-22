class AddDiscountPriceToDiscountProduct < ActiveRecord::Migration
  def change
    add_column :discount_products, :discount_price, :decimal
  end
end
