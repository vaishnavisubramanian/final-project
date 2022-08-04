class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index

    render "home/index"
  end
  def home
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
      render "home/home"  
    else
      @presence = 0
      render "home/home"
    end
  end
end
