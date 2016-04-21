class AddUrlToSliders < ActiveRecord::Migration
  def change
    add_column :sliders, :url, :string
  end
end
