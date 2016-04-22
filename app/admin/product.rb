ActiveAdmin.register Product do
	permit_params :title, :department, :category, :price, :discount, :description, :department_id, :category_id, :product_attribute_id,
                attachments_attributes: [:image, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id],
                product_attributes_attributes: [:title, :details, :_destroy, :id]
  collection_action :change_categories, :method => :get do
    @categories = Category.where("department_id = ?", Department.find(params[:product_department_id]))
    render :text => view_context.options_from_collection_for_select(@categories, :id, :name)
  end
  member_action :change_categories, :method => :get do
    @categories = Category.where("department_id = ?", Department.find(params[:product_department_id]))
    render :text => view_context.options_from_collection_for_select(@categories, :id, :name)
  end
  menu priority: 2
  batch_action :destroy

  filter :id
  filter :title
  filter :price
  filter :department
  filter :category#, collection: 
  filter :created_at
  filter :discount

	index pagination_total: false do
    column :id
    column "Title", sortable: :title do |p|
      link_to p.title, admin_product_path(p)
    end
    column :price
    column :discount
    column "Discount percentage" do |product|
      number_to_percentage(product.discount_percent(product.price, product.discount), precision: 0) if !product.price.nil? && !product.discount.nil?
    end
  	column :department  
  	column :category
    column :created_at, filter: :created_at, as: :check_boxes
    column "Image" do |product|
      image_tag(product.attachments.first.image.url(:thumbnail))
    end
    actions dropdown: true 
  end
  

  show do
    attributes_table do
      row :id
      row :title
      row :price
      row :discount
      row "Discount percentage" do
        number_to_percentage(product.discount_percent(product.price, product.discount), precision: 0) if !product.price.nil? && !product.discount.nil?
      end
      row :description
      row :department
      row :category
      row :created_at
      row :updated_at
      row "Images" do
        ul do
          product.attachments.each do|attachment|
            ul do image_tag(attachment.image.url(:admin_panel)) end
          end
        end
      end
      table_for product.product_attributes do
        column "Title" do |attribute|
          attribute.title
        end
        column "Details" do |attribute|
          attribute.details
        end
      end
    end
  end

  form(:html => { :multipart => true }) do |f|
    f.semantic_errors # shows errors on :base
    inputs 'Details' do
      f.input :title
      f.input :price  
      f.input :discount
      f.input :description
      f.input :department, include_blank: false, :input_html => {
        onchange: remote_get("change_categories", 'product_department_id', :product_category_id)
      }
      f.input :category, include_blank: false, collection: Category.where("department_id = ?", 1)
      inputs 'Product details' do end
      f.has_many :product_attributes, allow_destroy: true, heading: 'details', new_record: true do |dasset|
        dasset.input :title
        dasset.input :details
      end
      inputs 'First image will be displayed as thumbnail!' do end
      f.has_many :attachments, allow_destroy: true, heading: 'Image', new_record: true do |fasset|
        fasset.input :image, as: :file
      end
    end
    f.actions dropdown: true          # adds the 'Submit' and 'Cancel' buttons
  end
  
  controller do
    def scoped_collection
      super.includes :category, :department, :attachments # prevents N+1 queries to your database
    end
  end

end