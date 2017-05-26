class BookingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @booking = Booking.new(booking_params)
    @booking.product = @product
    @booking.user = current_user

    # @booking.product = Product.find(params[:product_id])

    if @booking.save
      redirect_to user_path(current_user)
      UserMailer.creation_confirmation(@booking).deliver_now
    else
      render "products/show"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    @booking.save
    # @booking.update(booking_params)

    redirect_to user_path(current_user)

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user)
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
    params.require(:booking).permit(:check_in, :check_out, :status)
  end

end
