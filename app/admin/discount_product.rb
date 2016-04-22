ActiveAdmin.register DiscountProduct do
permit_params :product_id, :discount_price
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
  f.inputs "Enter product id" do
    f.input :product_id
    f.input :discount_price
  end
  f.actions
end

show do
    attributes_table do
      row :id
      row :product_id
      row "Discount price", :discount_price
      row "Original price" do
      	discount_product.product.price
      end
      row :created_at
    end
  end

  index pagination_total: false do
    column :id
  	column :product_id  
  	column "Discount price", :discount_price
    column "Original price" do |current_discount_product|
    	current_discount_product.product.price
    end
    column "Discount percentage" do |current_discount_product|
    	number_to_percentage(current_discount_product.product.discount_percent(current_discount_product.product.price, current_discount_product.discount_price), precision: 0) if !current_discount_product.product.price.nil? && !current_discount_product.discount_price.nil?
    end
    column :created_at
    column "Image" do |current_discount_product|
      image_tag(current_discount_product.product.attachments.first.image.url(:thumbnail))
    end
    actions dropdown: true 
  end






end
