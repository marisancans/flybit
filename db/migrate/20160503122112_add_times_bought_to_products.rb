class AddTimesBoughtToProducts < ActiveRecord::Migration
  def change
    add_column :products, :times_bought, :integer
  end
end
