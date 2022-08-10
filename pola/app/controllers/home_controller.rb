# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    render 'home/index'
  end

  def home
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'home/home'
  end

  def about
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'home/about'
  end

  def service
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'home/service'
  end

  def bookings
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'home/bookings'
  end

  def addbus
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    render 'home/bookings'
  end
end
