class StaticPagesController < ApplicationController

  include CurrentCart
  before_action :set_cart

  def home
    @sliders = Slider.all
    @discount_products = DiscountProduct.all
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
