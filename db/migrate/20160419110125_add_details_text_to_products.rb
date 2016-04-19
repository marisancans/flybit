class AddDetailsTextToProducts < ActiveRecord::Migration
  def change
		add_column :products, :details_text, :text, array: true, default: []
  end
end
