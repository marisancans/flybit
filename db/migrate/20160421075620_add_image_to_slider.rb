class AddImageToSlider < ActiveRecord::Migration
  def change
  	add_column :sliders, :image, :string
  end
end
