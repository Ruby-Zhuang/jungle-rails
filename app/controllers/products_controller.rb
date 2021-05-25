class ProductsController < ApplicationController

  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)
    # VIEW
    # render :index <- this is implicit in Rails and runs behind the scenes if there's nothing else special going on (ex. redirects)
  end

  def show
    @product = Product.find params[:id]
  end

end
