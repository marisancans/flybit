class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :index]

	def show
    #if current_user
  	@product = Product.find(params[:id])
    #@department = Department.find(@product.department_id)
	end

  def index
    @products = Product.where("category_id = ?", params[:selected]).paginate(page: params[:page])
    @current_category = Category.find(params[:selected]).name
  end
 # @products = Product.where("category_id = ?", params[:selected])
  #  .map{|p| [p.title, p.price] }#.paginate(page: params[:page]) Get only title, price etc. 

  def new
    @product = Product.new
  end

  def create
    #Cloudinary::Uploader.upload(params[:picture])
    @product = Product.new(product_params)
    #Cloudinary::Uploader.upload(params[:product][:image])
    @product.save

    redirect_to action: "new"
  end



	private

  def product_params
    params.require(:product).permit(:title, :image)
  end
  
end