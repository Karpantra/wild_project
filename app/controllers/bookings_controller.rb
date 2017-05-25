class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @booking = Booking.new(booking_params)
    @booking.product = Product.find(params[:product_id])
    @booking.user = current_user
    @product = Product.find(params[:product_id])
    if @booking.save
      redirect_to user_path(current_user)
    else
      render "products/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

end
