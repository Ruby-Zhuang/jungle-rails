class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'test', password: 'test'

  def show
  end
end
