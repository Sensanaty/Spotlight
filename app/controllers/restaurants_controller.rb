class RestaurantsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :longitude, :latitude, :cuisine, :price_level, :user_id, :photo)
  end
end
