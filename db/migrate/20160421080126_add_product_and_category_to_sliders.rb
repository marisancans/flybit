class AddProductAndCategoryToSliders < ActiveRecord::Migration
  def change
    add_reference :sliders, :product, index: true, foreign_key: true
    add_reference :sliders, :category, index: true, foreign_key: true
  end
end
