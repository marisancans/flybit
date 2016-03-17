class ProductsController < ApplicationController

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






#def show
#  	@user = User.find(params[:id])
#    @microposts = @user.microposts.paginate(page: params[:page])
#  end
#
#  def new
#  	@user = User.new
#  end
#
#  def index
#    @users = User.paginate(page: params[:page])
#  end