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
      #Category based search
      @products = Product.search(params[:search], params[:selected]).includes(:attachments).paginate(page: params[:page], :per_page => 30)
    else
      #List all products based on category
      @products = Product.where("category_id = ?", params[:selected]).paginate(page: params[:page])
    end
    @current_category = Category.find(params[:selected]).name
  end

  def product_search 
    #Global search
    @products = Product.search(params[:search], params[:selected]).order("created_at DESC").paginate(page: params[:page], :per_page => 30) if params[:search].present?
    @categories = Category.all
  end

end