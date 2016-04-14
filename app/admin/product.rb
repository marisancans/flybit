ActiveAdmin.register Product do
	permit_params :title, :department, :category, :price, images_attributes: [:file_name, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id]


  collection_action :change_categories, :method => :get do
    @categories = Category.where("department_id = ?", Department.find(params[:product_department_id]))
    render :text => view_context.options_from_collection_for_select(@categories, :id, :name)
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
      cl_image_tag("#{product.images[0].identifier}", height: 200) unless product.images.empty?
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
      panel 'Images' do
        product.images.each do|image|
          image_tag(image.url)
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

      #f.inputs "Image",  :for => [:image, f.object.images || Image.new] do |i|
      #  i.input :file_name, :for => :image, :as => :file
      #end

      f.inputs 'Фотографии' do
        f.has_many :images, allow_destroy: true, heading: 'Фото', new_record: true do |fasset|
          fasset.input :file_name, as: :file
        end
      end

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
