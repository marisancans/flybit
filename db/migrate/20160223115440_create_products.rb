class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	    t.string :title
	    t.text :description
	    t.decimal :price
      t.timestamps null: false
    end

 #   add_column :products, :category_id
 #   add_foreign_key :products, :categories
    add_reference :products, :department, index: true, foreign_key: true
    add_foreign_key :products, :departments
  end
end
