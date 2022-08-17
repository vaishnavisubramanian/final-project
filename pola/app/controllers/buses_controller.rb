# frozen_string_literal: true

class BusesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  @@booking_detail = nil
  def new
    render 'new'
  end

  def create
    bus = Bus.new(bus_number: params[:bus_number], travel_name: params[:travel_name],
                  number_of_seats: params[:number_of_seats], bus_type: params[:bus_type], seat_type: params[:seat_type])
    if bus.save
      id = bus.id
      from_location = Place.find_by(place: params[:from_location])
      to_location = Place.find_by(place: params[:to_location])
      puts '------------------'
      puts from_location.id
      puts to_location.id
      bus_shift = BusShift.new(bus_id: id, shift: params[:shift], fare: params[:fare],
                               departure_time: params[:departure_time], arrival_time: params[:arrival_time], conductor_name: params[:conductor_name], conductor_phone_number: params[:conductor_phone_number], from_location_id: from_location.id, to_location_id: to_location.id)
      if bus_shift.save
        redirect_to buses_path
      else
        flash[:error] = bus_shift.errors.full_messages
        redirect_to '/buses/new'
      end
    else
      flash[:error] = bus.errors.full_messages
      redirect_to '/buses/new'
    end
  end

  def index
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
    else
      @presence = 0
    end
    @bus = Bus.all
    render '/buses/index'
  end

  def destroy
    id = params[:id]
    bus = Bus.find(id)
    bus_id = bus.id
    bus_shift = BusShift.find_by(bus_id: bus_id)
    if bus.destroy && bus_shift.destroy
      redirect_to buses_path
    else
      render plain: 'Failed'
    end
  end

  def list_bus
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
      puts '!@#!@!#!#!@@#!##!{}{}{}{}{}{}{}{}}{}{}{}{}{}{}{}{}{]}[]'
      puts @presence
    else
      @presence = 0
    end

    @bus_list = searched_bus_array
  end

  def edit_bus
    bus_id = params[:bus_id]
    @bus = Bus.find(bus_id)
    @bus_shift = BusShift.where(bus_id: @bus.id).first
    puts @bus_shift.shift
  end

  def update_bus
    bus = Bus.find(params[:bus_id])
    bus_shift = BusShift.where(bus_id: bus.id).first
    bus.update(bus_number: params[:bus_number], travel_name: params[:travel_name],
               number_of_seats: params[:number_of_seats], bus_type: params[:bus_type], seat_type: params[:seat_type])
    if bus.save
      id = bus.id
      from_location = Place.find_by(place: params[:from_location])
      to_location = Place.find_by(place: params[:to_location])
      bus_shift.update(departure_time: params[:departure_time],
                        shift: params[:shift],
                        fare: params[:fare],
                        arrival_time: params[:arrival_time],
                        conductor_name: params[:conductor_name],
                        conductor_phone_number: params[:conductor_phone_number],
                        from_location_id: from_location.id,
                        to_location_id: to_location.id)

      if bus_shift.save
        redirect_to '/buses/index'
      else
        render plain: 'Fail'
      end
    end

    puts '[][][[][][][][][][][][][][][[][][][]'
  end

  def payment
    current_user
    booking_detail = BookingDetail.new(bus_id: params[:bus_id],bus_shift_id: params[:bus_shift_id],
    seats_wanted: params[:seats_wanted], main_passenger_name: params[:main_passenger_name], age: params[:age],
  phone_number: params[:phone_number])
  if booking_detail.save
    @@booking_detail = booking_detail.id
    @user = User.find(current_user.id)
    @bus_list = searched_bus_array
    redirect_to '/buses/payment/pay'
  else
    render plain: "Fail"
  end
  end

  def booking_detail_returner
    return @@booking_detail
  end

  def success
    puts params[:booking_detail_id]
    payment_detail = PaymentDetail.new(booking_details_id: params[:booking_detail_id],card_number: params[:card_number], card_holder_name: params[:card_holder_name], month: params[:month], year: params[:year], cvv: params[:cvv])
    payment_detail.save
    render plain: "Success"
  end
  def pay
    @booking_detail = booking_detail_returner
  end

end
