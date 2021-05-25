# CONTROLLER
class ProductsController < ApplicationController

  # ACTION
  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)

    # VIEW
    # render :index 
    # ^ this is implicit in Rails and runs behind the scenes if there's nothing else special going on (ex. redirects)
    # If you don't render anything at the end of an action, it will render the name of that action as a template
  end

  def show
    @product = Product.find params[:id]
  end

end
