class ProductsController < ApplicationController

	def show
  	@product = Product.find(params[:id])
	end

  def index
    @products = Product.paginate(page: params[:page])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def new
  	@product = Product.new
  	@category_options = Category.all.map{|u| [ u.name, u.id ] }
  end

   def create
    @product = Product.new(product_params)
    if @product.save
      flash[:info] = "successfully added"
      redirect_to root_url
      #request.referrer || root_url
    else
      render 'new'
    end
	 end

	private

 		def product_params
      params.require(:product).permit(:title, :description, :price, :category_id)
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