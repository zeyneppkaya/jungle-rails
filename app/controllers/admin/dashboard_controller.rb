class Admin::DashboardController < ApplicationController
  puts "++++++++++++++++++++++++++++++++++ #{ENV['HTTP_USERNAME']}"
  http_basic_authenticate_with name: ENV['HTTP_USERNAME'], password: ENV['HTTP_PASSWORD']
  def show
  end
end
