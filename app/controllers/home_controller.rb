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
    @bus 
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

  def booking_faq
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render '/home/booking_faq'
  end

  def payment_faq
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render 'home/payment_faq'
  end

  def cancellation_faq
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render '/home/cancellation_faq'
  end

  def refunds_faq
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render 'home/refunds_faq'
  end

  def general_faq
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render '/home/general_faq'
  end

  def account_faq
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render 'home/account_faq'
  end

  def search
    @from_location = Place.find_by(place: params[:from_location])
    @to_location = Place.find_by(place: params[:to_location])
    if !@from_location.nil? && !@to_location.nil?
      @from_location_id = @from_location.id
      @to_location_id = @to_location.id
      @bus1 = BusShift.where(from_location_id: @from_location_id).and(BusShift.where(to_location_id: @to_location_id))
      @bus = []
      @bus1.each do |bus|
        @bus << bus.id
      end
    else
      @bus = []
    end

    session[:searched_bus_array] = @bus
    puts @bus.length
    redirect_to bus_list_path
  end
end
