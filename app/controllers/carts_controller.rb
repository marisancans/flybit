class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    #@disable_shopping_cart = true
    #current_user.cart_id = 1
    #if current_user.cart_id = params[:cart_id] 
    #  then
    #  @a = "true" else @a = "false"
   # end
  end

  def navbar_cart
    @cart = Cart.find(session[:cart_id])
    respond_to do |format|
      format.js
    end
  end

  def continue_shopping
    session[:return_to] ||= request.env['HTTP_REFERER'] || root_url
    redirect_to session.delete(:return_to)
    session[:last_product_page] = request.env['HTTP_REFERER'] || products_url
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    respond_to do |format|
      if @line_item.save
        format.js { @item = params[:id] }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  def empty_line_items
    @cart = Cart.find(session[:cart_id])
    @cart.line_items.each do |line_item|
      line_item.destroy
    end
    respond_to do |format|
      format.js { @cart = Cart.find(session[:cart_id]) }
      format.json { head :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(session[:cart_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    end   
end