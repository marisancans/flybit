class LineItemsController < ApplicationController
  skip_before_action :authorize, only: :create
  include CurrentCart
  before_action :set_cart, only: [:create, :destroy, :qty, :decrease, :increase, :input_field_change]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    #set_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    #expire_fragment('navbar')

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to root_url }
        format.js { @current_item = @line_item }
        format.json { render action: 'show', 
          status: :created, location: @line_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @line_item.errors, 
          status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

 # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
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

  def qty
    @index = params[:index]
    if request.post? #-> increment
      increase
    elsif request.delete? #-> decrement
      decrease
    end

    #@item.send(method, :qty, params[:qty])
  end

  def decrease
    @line_item = @cart.decrease(params[:id])
    respond_to do |format|
      if @line_item.save
        format.js { @item = @cart.line_items.find(params[:id]) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity}
      end
    end
  end

  def increase
    @line_item = @cart.increase(params[:id])
    respond_to do |format|
      if @line_item.save
        format.js   { @item = @cart.line_items.find(params[:id]) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def input_field_change
    @index = params[:index]
    @line_item = @cart.input_field_change(params[:id], params[:quantity])
    respond_to do |format|
      if @line_item.save
        format.js   { @item = @cart.line_items.find(params[:id]) }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
  
    def line_item_params
      params.require(:line_item).permit(:product_id)
    end 
end