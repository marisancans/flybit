class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
	    t.integer :quantity
      t.timestamps null: false
    end

    add_reference :carts, :product, index: true, foreign_key: true
    add_foreign_key :carts, :product
  end
end
