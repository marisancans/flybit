class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	    t.string :title
	    t.text :description
	    t.decimal :price
      t.timestamps null: false
      t.integer  :department_id
      t.integer  :category_id
    end

 #   add_column :products, :department_id
 #   add_foreign_key :products, :categories
    #add_reference :products, :department, index: true, foreign_key: true

    #add_reference :products, :category, index: true, foreign_key: true
  end
end
