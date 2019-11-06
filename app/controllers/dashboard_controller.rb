class DashboardController < ApplicationController
  def home
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def feed
  end

  def explore
  end
end