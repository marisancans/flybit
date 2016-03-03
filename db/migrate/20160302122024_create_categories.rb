class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name
    	t.text :description
      t.timestamps null: false
    end

  add_reference :categories, :department, index: true, foreign_key: true
  add_foreign_key :categories, :departments

	end
end
