class StaticPagesController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def home
    @sliders = Slider.all
    @discount_products = Product.where("discount IS NOT NULL").order("RANDOM()").limit(4)
    @top_products = Product.order("times_bought DESC").limit(4)
    @special_products = Product.where("special IS TRUE").order("RANDOM()").limit(4)
    #where.not(user_id: "")
    #User.find(:all, )
    #Model.order('rand()').limit(1).first.name
  end
  
end
