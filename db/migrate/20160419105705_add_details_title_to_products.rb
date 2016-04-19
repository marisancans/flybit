class AddDetailsTitleToProducts < ActiveRecord::Migration
  def change
    add_column :products, :details_title, :string, array: true, default: []
  end
end
