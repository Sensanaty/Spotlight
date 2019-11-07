class UsersController < ApplicationController
  before_action :authenticate_user!, exclude: [:new, :create]

  def edit_profile
    @user = current_user
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit_profile
    end
  end

  def payment
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :photo)
  end
end
