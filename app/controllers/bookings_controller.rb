class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @product = Product.find(params[:product_id])
    @booking.product = @product
    if @booking.save
      redirect_to user_path(current_user)
      UserMailer.creation_confirmation(@booking).deliver_now
    else
      render "products/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path
  end


  # def creation_confirmation(booking)
  #   @booking = booking
  #   mail(
  #   to:       @booking.user.email,
  #   subject:  "Booking created!"
  #   )
  # end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

end
