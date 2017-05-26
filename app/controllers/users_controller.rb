class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @pending_bookings = current_user.bookings.where(status: 'pending')
    @confirmed_bookings = current_user.bookings.where(status: 'confirmed')
    @last_bookings = current_user.bookings.where(status: 'close')

    ######################################################
    @booking_to_confirm = []
    current_user.products.each do |product|
      @booking_to_confirm << product.bookings.where(status: 'pending')
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  # def datepicker_input form, field
  #   content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
  #     form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
  #   end
  # end


  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :description, :photo)
    end
end

# def my_products
#     @products = Product.where(user: current_user)
#     @product = Product.new
#     @owner_bookings = []
#     @pending_bookings = []
#     @accepted_bookings = []
#     @products.each do |product|
#       @owner_bookings << product.bookings
#       @pending_bookings << product.bookings.where(status: 'pending')
#       @accepted_bookings << product.bookings.where(status: 'accepted')
#     end
#     @owner_bookings = @owner_bookings.flatten
#     @pending_bookings = @pending_bookings.flatten
#     @accepted_bookings = @accepted_bookings.flatten
#   end
