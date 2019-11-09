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

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to root_path
    else
      render :edit_profile
    end
  end

  def find_yelp_restaurant
    @restaurant = current_user.restaurant
    # The 'grab_place' method returns false if restaurant is not found on Yelp, or true if it is.
    # This boolean is saved to @search_match.
    @search_match = YelpFetcherService.new(@restaurant.longitude, @restaurant.latitude).grab_place(@restaurant.id)

    # Logic to display whether
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
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
