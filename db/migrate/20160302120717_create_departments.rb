class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
			t.string :name
      t.timestamps null: false
      t.integer :categories_count
    end
  end
end
