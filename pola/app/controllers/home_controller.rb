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
  def search
    @from_location_id = Place.find_by(place: params[:from_location]).id
    @to_location_id = Place.find_by(place: params[:to_location]).id
    puts (@from_location_id != nil)
    @bus = BusShift.where(from_location_id: from_location_id).and(BusShift.where(to_location_id: to_location_id))
    puts (@bus != nil)
  end
end
