class CreateProductAttributes < ActiveRecord::Migration
  def change
    create_table :product_attributes do |t|
      t.string :title
      t.text :details

      t.timestamps null: false
    end
  end
end
