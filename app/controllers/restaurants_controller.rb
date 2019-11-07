class RestaurantsController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = current_user
    @restaurant = Restaurant.new()
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.save!
      redirect_to payment_users_path
    else
      render :new
    end
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :longitude, :latitude, :cuisine, :price_level, :user_id, :photo)
  end
end
