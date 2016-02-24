class ProductsController < ApplicationController

	def show
  	@product = Product.find(params[:id])
	end


  def index
    @products = Product.paginate(page: params[:page])
  end





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