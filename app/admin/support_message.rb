ActiveAdmin.register SupportMessage do
		permit_params :email, :content

  show :title => :id do
    attributes_table do
      row :id
      row "Registred user?" do |order|
        User.exists?(email: order.email) ? status_tag( "yes", :ok ) : status_tag( "no", :ok )
      end
      row "Email" do |message|
      	user = User.where(email: message.email).first
      	if user.blank?
       		message.email
      	else
      		link_to message.email, admin_user_path(user.id) 
      	end
      end
      row :content
      row :created_at
      row :updated_at
    end
  end

  index pagination_total: false do
    column :id
    column "email" do |message|
      link_to message.email, admin_support_message_path(message)
    end
  	column :content
    column :created_at
  end

end
