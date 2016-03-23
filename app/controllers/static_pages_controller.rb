class StaticPagesController < ApplicationController
  include CurrentCart
  
  def home
    #@cart = current_cart
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
