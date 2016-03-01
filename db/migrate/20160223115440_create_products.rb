class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
	    t.string :title
	    t.text :description
	    t.decimal :price
      t.timestamps null: false
    end

    add_foreign_key :products, :categories, column: :category_id

  end
end
