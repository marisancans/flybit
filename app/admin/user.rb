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
