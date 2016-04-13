ActiveAdmin.register Product do
	permit_params :title, :department, :category, :price, {images: []}
  collection_action :change_categories, :method => :get do
    @categories = Category.where("department_id = ?", Department.find(params[:product_department_id]))
    render :text => view_context.options_from_collection_for_select(@categories, :id, :name)
  end
  before_create do |product|
    params[:product][:images].each do |image|
      Cloudinary::Uploader.upload(image)
    end
  end

  filter :id
  filter :title
  filter :price
  filter :department
  filter :category#, collection: 
  filter :created_at

	index pagination_total: false do
    column :id
    column "Title", sortable: :title do |p|
      link_to p.title, admin_product_path(p)
    end

  	column :department  
  	column :category
    column :created_at, filter: :created_at, as: :check_boxes

    column "Image" do |product|
      cl_image_tag(product.images[0].url, height: 200)
    end

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
      row :images do
        ul do
          product.images.each do |image|
            ul do
              image_tag(image.url(:admin_panel))
            end
          end
        end
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.semantic_errors # shows errors on :base
      inputs 'Details' do
        f.input :title
        f.input :price  
        f.input :description
        f.input :department, include_blank: false, :input_html => {
          onchange: remote_get("change_categories", 'product_department_id', :product_category_id)
        }
        f.input :category, include_blank: false, collection: ""
        f.input :images, as: :file, input_html: { multiple: true }
      end
       f.actions dropdown: true          # adds the 'Submit' and 'Cancel' buttons
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
