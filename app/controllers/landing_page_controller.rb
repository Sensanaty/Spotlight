class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  def landing_page
    render layout: false
  end

  def how_it_works
    render layout: false
  end

  def pricing
    render layout: false
  end
end
