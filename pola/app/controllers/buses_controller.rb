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
        render plain: "Success in Bus Shift"
      else
        render plain: "False in Bus Shift"
      end
    else
       render plain: "False in Bus"
    end
  end

end
