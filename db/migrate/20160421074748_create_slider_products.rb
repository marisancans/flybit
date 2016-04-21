class CreateSliderProducts < ActiveRecord::Migration
  def change
    create_table :slider_products do |t|

      t.timestamps null: false
    end
  end
end
