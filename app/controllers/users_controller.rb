class UsersController < ApplicationController
  def edit_profile
    @user = current_user
    @restaurant = Restaurant.find_by(user_id: current_user)
  end

  def update_profile
  end
end
