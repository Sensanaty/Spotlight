Rails.application.routes.draw do
  devise_for :users
  
  # Check whether the user is authenticated (logged in) or not, if not then take them to a landing page, otherwise take
  # them to the dashboard page
  authenticated do
    root :to => 'dashboard#home', as: :authenticated
  end
  root :to => 'landing_page#landing_page'
  
  # resources :home, only: [:index, :show]
end