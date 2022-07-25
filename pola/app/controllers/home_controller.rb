class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render "home/index"
  end
  def home
    render "home/home"
  end
end
