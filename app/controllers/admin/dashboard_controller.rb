class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with :name => ENV['HBA_NAME'], :password => ENV['HBA_PASSWORD']
  def show
  end
end
