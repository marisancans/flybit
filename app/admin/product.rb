ActiveAdmin.register Product do
	permit_params :title, :department, :category, :price

  form do |f|
  f.input :product_id, as: :search_select, url: admin_product_path,
          fields: [:title], display_name: 'title', minimum_input_length: 2
  end
  filter :price, as: :range_select



  filter :department
  filter :category#, collection: 
  filter :created_at

	index pagination_total: false do
    column "Title", sortable: :title, filter: title do |p|
      link_to p.title, admin_product_path(p)
    end
    number_column :price, as: :currency, unit: "$", separator: ","
  	column :department, sortable: "departments.name"     
  	column :category, sortable: "categories.name"
    column :created_at, filter: :created_at, as: :check_boxes
    image_column :image, style: :thumb
    actions dropdown: true 
  end

  controller do
    def scoped_collection
      super.includes :category # prevents N+1 queries to your database
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end


end
