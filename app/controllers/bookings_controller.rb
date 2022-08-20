class BookingsController < ApplicationController
  def index
    current_user
    @user_id = params[:user_id]
    @bookings = current_user.booking_details
    @user = current_user
  end
  def destroy
    current_user
    @booking = BookingDetail.find(params[:booking_id])
    @payment = PaymentDetail.find_by(booking_detail_id: params[:booking_id])
    if @payment.destroy
      if @booking.destroy
        redirect_to "/user_bookings/#{current_user.id}"
      else
        render plain: "False in booking"
      end
    else
      render plain: "False in payment"
    end
  end
end
