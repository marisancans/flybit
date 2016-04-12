class AddZipCodeAndCityAndCountryAndCountyCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :zip_code, :string
    add_column :orders, :city, :string
    add_column :orders, :country, :string
    add_column :orders, :country_code, :string
  end
end
