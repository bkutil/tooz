class StaticPagesController < ApplicationController
  def index
    @products = Product.all
  end

  def cart
    @products = Product.all
  end
end
