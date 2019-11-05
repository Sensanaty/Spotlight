class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :dashboard]

  def home
  end


# Below are all temporary controllers
  def dashboard
  end

  def components
  end

  def components_josh
  end
end
