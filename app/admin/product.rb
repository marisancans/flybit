ActiveAdmin.register Product do
	permit_params :title, :department, :category, :price, :image

  filter :id
  filter :title
  filter :price, as: :range_select
  filter :department
  filter :category#, collection: 
  filter :created_at

	index pagination_total: false do
    column :id
    column "Title", sortable: :title do |p|
      link_to p.title, admin_product_path(p)
    end
    number_column :price, as: :currency, unit: "$", separator: ","
  	column :department, sortable: "departments.name"     
  	column :category, sortable: "categories.name"
    column :created_at, filter: :created_at, as: :check_boxes
    image_column :image, style: :thumb
    actions dropdown: true 
  end

  show do
    attributes_table do
      row :id
      row :title
      row :price
      row :description
      row :department
      row :category
      row :created_at
      row :updated_at
     # panel 'Markup' do
     #   "Image details"
     # end
      image_row :image
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :image_uploaded_at
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
      inputs 'Details' do
        input :title
        input :price  
        input :description
        input :department
        input :category
        input :image
      end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end

  controller do
    def scoped_collection
      super.includes :category, :department # prevents N+1 queries to your database
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
