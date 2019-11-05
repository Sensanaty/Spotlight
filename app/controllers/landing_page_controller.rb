class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!

  def landing_page
    @location = GoogleFetcherService.new("La Barraca Canggu").grab_place
  end

  def how_it_works
  end

  def pricing
  end
end
