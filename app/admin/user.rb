ActiveAdmin.register User do
	permit_params :email, :password


	filter :email
	filter :last_sign_in_at
	filter :sign_in_count

	index pagination_total: false do
    column "Email", sortable: :email do |u|
      link_to u.email, admin_user_path(u)
    end
  	column "Registred at", :created_at
  	column :last_sign_in_at
  	column :sign_in_count
    actions dropdown: true 
  end

  show do
    attributes_table do
      row :email
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
      if user.orders.empty?
        render plain: "Error, no items found"
      else
        user.orders.each do |order|
          panel link_to "Order id: #{order.id}, amount: #{number_to_currency(order.amount,:unit=>'€ ')}", admin_order_path(order) do
            table_for order.line_items do
              column :id
              column "Title" do |item|
                link_to item.product.title, admin_product_path(item.product.id)
              end
              column :quantity
              column :created_at
              column "price" do |item|
                number_to_currency(item.total_price,:unit=>'€ ')
              end
            end

          end
        end
      end
    end
  end

  form do |f|
  	f.semantic_errors
  		inputs 'Details' do
	  		input :email
	  		input :password, :label => "New password"
	  	end
	  f.actions
	end


end
