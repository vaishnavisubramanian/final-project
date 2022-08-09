class BusesController < ApplicationController

  def new
    render "new"
  end
  def create
    bus = Bus.new(bus_number: params[:bus_number],travel_name: params[:travel_name],number_of_seats: params[:number_of_seats],bus_type: params[:bus_type],seat_type: params[:seat_type])
    if bus.save
      id = bus.id
      from_location = Place.find_by(place: params[:from_location])
      to_location = Place.find_by(place: params[:to_location])
      puts "------------------"
      puts from_location.id
      puts to_location.id
      bus_shift = BusShift.new(bus_id: id,shift: params[:shift],fare: params[:fare],departure_time: params[:departure_time],arrival_time: params[:arrival_time],conductor_name: params[:conductor_name],conductor_phone_number: params[:conductor_phone_number],from_location_id: from_location.id,to_location_id: to_location.id)
      if bus_shift.save
        redirect_to buses_path
      else
        flash[:error] = bus_shift.errors.full_messages
        redirect_to "/buses/new"
      end
    else
      flash[:error] = bus.errors.full_messages
      redirect_to "/buses/new"
    end
  end
  def index
    @presence = 0
    if current_user
      @presence = 1
      @user = User.find(current_user.id)
      @bus = Bus.all
      render "buses/index"
    else
      @presence = 0
      @bus = Bus.all  
      render "buses/index"
    end


  end
  def destroy
    id = params[:id]
    bus = Bus.find(id)
    bus_id = bus.id
    bus_shift = BusShift.find_by(bus_id: bus_id)
    if bus.destroy && bus_shift.destroy
      redirect_to buses_path
    else
      render plain: "Failed"
    end
  end

end
