class StaticPagesController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def home
    @sliders = Slider.all
    @discount_products = Product.where("discount IS NOT NULL").order("RANDOM()").limit(4)
    #where.not(user_id: "")
    #User.find(:all, )
    #Model.order('rand()').limit(1).first.name
  end

  def show
  end

  def help
  end

  def about
  end

  def contact
  end
end
