ActiveAdmin.register Category do
	permit_params :name, :department_id, :image

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
      f.input :department
      f.input :name
      f.input :image, as: :file
    	f.actions         # adds the 'Submit' and 'Cancel' buttons
  	end
  end

  index pagination_total: false do
    column :id
    column :name
  	column :department
    column :created_at
     column "Image" do |category|
      image_tag(category.image.url(:thumbnail)) if !category.image.nil?
    end
    actions
  end

    show do
    attributes_table do
      row :id
      row :name
      row :department
      row :created_at
      row "Image" do 
        image_tag(category.image.url(:thumbnail)) if !category.image.nil?
      end
    end
  end


end
