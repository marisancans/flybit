class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :index, :product_search]

	def show
    #if current_user
  	@product = Product.find(params[:id])
    #@department = Department.find(@product.department_id)
	end

  def index
    if !params[:search].blank? 
      @products = Product.search(params[:search], params[:selected]).includes(:attachments).paginate(page: params[:page], :per_page => 30)
    else
      @products = Product.where("category_id = ?", params[:selected]).paginate(page: params[:page])
    end
    @current_category = Category.find(params[:selected]).name
  end

  def product_search 
    @products = Product.search(params[:search], params[:selected]).order("created_at DESC").paginate(page: params[:page], :per_page => 30) if params[:search].present?
    @categories = Category.uniq_product_categories(@products.uniq(:category_id)) if !@products.blank?
  end
 # @products = Product.where("category_id = ?", params[:selected])
  #  .map{|p| [p.title, p.price] }#.paginate(page: params[:page]) Get only title, price etc. 

  #def new
  #  @product = Product.new
  #end

  #def create
    #Cloudinary::Uploader.upload(params[:picture])
   # @product = Product.new(product_params)
    #params[:product][:images_attributes].each do 
    #respond_to do |format|
     # if @product.save
    #    format.html { redirect_to @product, notice: 'Product was successfully created.' }
    #    format.json { render :show, status: :created, location: @product }
    #  else
    #    format.html { render :new }
    #    format.json { render json: @product.errors, status: :unprocessable_entity }
    #  end
   # end

   # redirect_to action: "new"
  #end



	#private

  #def product_params
    #params.require(:product).permit(:title, :description, :images_attributes)
  #end
  
end