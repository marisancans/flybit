class CreateDiscountProducts < ActiveRecord::Migration
  def change
    create_table :discount_products do |t|
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
