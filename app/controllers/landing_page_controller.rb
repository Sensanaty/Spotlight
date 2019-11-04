class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  def landing_page
    render layout: false
  end
end
