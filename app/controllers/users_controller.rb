class UsersController < ApplicationController

  def show
    @user = current_user
    @pending_bookings = current_user.bookings.where(status: 'pending')
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def datepicker_input form, field
    content_tag :td, :data => {:provide => 'datepicker', 'date-format' => 'yyyy-mm-dd', 'date-autoclose' => 'true'} do
      form.text_field field, class: 'form-control', placeholder: 'YYYY-MM-DD'
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :email, :phone_number, :description, :photo)
    end
end
