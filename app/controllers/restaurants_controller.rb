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
      GoogleFetcherService.new(Restaurant.last.name).grab_place(Restaurant.last.id)
    else
      render :new
    end
  end

  def edit
  end

  def find_yelp_restaurant
    puts "Fetching Yelp Restaurants"
    YelpFetcherService.new(Restaurant.last.longitude, Restaurant.last.latitude).grab_place(Restaurant.last.id)
  end

  def find_zomato_restaurant
    puts "zomato"
  end

  def find_tripadvisor_restaurant
    puts "tripadvisor"
  end

  def find_foursquare_restaurant
    puts "foursquare"
  end

  def find_facebook_restaurant
    puts "foursquare"
  end

  def find_instagram_restaurant
    puts "foursquare"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :longitude, :latitude, :cuisine, :price_level, :user_id, :photo)
  end
end
