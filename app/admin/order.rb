ActiveAdmin.register Order do
	menu :label => "Orders", :priority => 2
	permit_params :email, :address, :name, :pay_type, 
								:created_at, :updated_at, :user_id,
								:zip_code, :city, :country, :country_code


	show :title => :id do
    attributes_table do
      row :id
      row :name
      row :address
      row :email
      row :pay_type
      row :created_at
      row :updated_at
      row :user_id
      row :zip_code
      row :city
      row :country
      row :country_code
      #row :line_items do |i|
      #	i.line_items.each do |item|
      #		link_to item.product.title
      #	end
      #end
      panel "items" do
	      table_for order.line_items do
	      	column :id
	      	column "name" do |item|
	      		link_to item.product.title, admin_product_path(item.product.id)
	      	end
	      	column :quantity
	      	column :created_at
	      	column "price" do |item|
	      		item.total_price
	      	end
	      end
	    end
	    f.actions dropdown: true 
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
      inputs 'Details' do
	      f.input :id
	      f.input :name
	      f.input :address
	      f.input :email
	      f.input :pay_type
	      f.input :created_at
	      f.input :updated_at
	      f.input :user_id
	      f.input :zip_code
	      f.input :city
	      f.input :country
	      f.input :country_code
      end
    f.actions       # adds the 'Submit' and 'Cancel' buttons
  end






  controller do
    def scoped_collection
      super.includes :line_items # prevents N+1 queries to your database
    end
  end
 

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
