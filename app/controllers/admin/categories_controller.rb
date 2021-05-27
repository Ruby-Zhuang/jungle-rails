class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USERNAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @categories = Category.order(:id).all
  end

  def new
    # This instance variable is for the form_for method
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    # render plain: params[:category].inspect

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  private

  # Whitelist (explicitly allow) controller parameters to prevent wrongful mass assignment
  # Usually factored out so it can be reused by multiple actions in the same controller, for example create and update
  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
