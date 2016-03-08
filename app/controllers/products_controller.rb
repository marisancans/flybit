class ProductsController < ApplicationController

	def show
  	@product = Product.find(params[:id])
    #@department = Department.find(@product.department_id)
	end

  def index
    @products = Product.paginate(page: params[:page])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def destroy
    #Delete image from dropbox
    #@user.avatar = nil
    #@user.save
  end

  def new
  	@product = Product.new
  	@department_options = Department.all.map{|u| [ u.name, u.id ] }
    @categories = ""
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:info] = "successfully added"
      redirect_to new_product_path
      #request.referrer || root_url
    else
      render 'new'
    end
	 end

   def update_categories
        @categories = Category.where("department_id = ?", params[:department_id])
        respond_to do |format|
          format.js
        end
    end

	private

 		def product_params
      params.require(:product).permit(:title, :description, :price, 
                                      :department_id, :category_id, :image)
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