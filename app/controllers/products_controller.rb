class ProductsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:show, :index]

	def show
  	@product = Product.find(params[:id])
    #@department = Department.find(@product.department_id)
	end

  def index
    @products = Product.where("category_id = ?", params[:selected]).paginate(page: params[:page])
  end
 # @products = Product.where("category_id = ?", params[:selected])
  #  .map{|p| [p.title, p.price] }#.paginate(page: params[:page]) Get only title, price etc. 



	private
  
end