class AddPriceToDiscountProduct < ActiveRecord::Migration
  def change
    add_column :discount_products, :price, :decimal
  end
end
