ActiveAdmin.register Slider do
	permit_params :id, :title, :url, :image

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

  form do |f|
    f.semantic_errors # shows errors on :base
    inputs 'Details' do
      f.input :image, as: :file
      f.input :title
      f.input :url
    	f.actions         # adds the 'Submit' and 'Cancel' buttons
  	end
  end

  index pagination_total: false do
    column :id
    column "Path", sortable: :title do |s|
      link_to s.title, admin_slider_path(s)
    end
  	column :url  
    column :created_at
    column "Image" do |slider|
      cl_image_tag slider.image, :width => 250, :background => "white", :crop=>"pad"
    end
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :url
      row :created_at
      row :updated_at
      row "Image" do
        cl_image_tag slider.image, :width => 500, :background => "white", :crop=>"pad"
      end
    end
  end

end
