class AddAttributesToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :product_attribute, index: true, foreign_key: true
  end
end
