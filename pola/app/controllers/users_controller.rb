class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def render_signUp
    render "users/signUp"
  end

  def create_user
      user = User.new(user_params)
      if user.save
        redirect_to "/signin"

      else
        flash[:error] = user.errors.full_messages.first
        redirect_to "/signup"
      end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end







