class AddSpecialToProduct < ActiveRecord::Migration
  def change
    add_column :products, :special, :boolean, default: false
  end
end
