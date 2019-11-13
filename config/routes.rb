Rails.application.routes.draw do
  
  get 'reviews/new'
  get 'reviews/create'
  devise_for :users, controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users do
    collection do
      get :payment
      get :edit_profile
      post :update_profile
    end
  end
  # Check whether the user is authenticated (logged in) or not, if not then take them to a landing page, otherwise take
  # them to the dashboard page
  authenticated do
    root :to => 'dashboard#home', as: :authenticated
  end

  resources :restaurants, only: [:new, :update, :create]

  get '/restaurants/find_yelp_restaurant', to: 'restaurants#find_yelp_restaurant'
  get '/restaurants/find_zomato_restaurant', to: 'restaurants#find_zomato_restaurant'
  get '/restaurants/find_tripadvisor_restaurant', to: 'restaurants#find_tripadvisor_restaurant'
  get '/restaurants/find_foursquare_restaurant', to: 'restaurants#find_foursquare_restaurant'
  get '/restaurants/find_facebook_restaurant', to: 'restaurants#find_facebook_restaurant'
  get '/restaurants/find_instagram_restaurant', to: 'restaurants#find_instagram_restaurant'


  root :to => 'landing_page#landing_page'

  get '/dashboard/feed', to: 'dashboard#feed', as: "dashboard_feed"
  get '/dashboard/explore', to: 'dashboard#explore', as: "dashboard_explore"

  get '/landing_page/how-it-works', to: 'landing_page#how_it_works'
  get '/landing_page/pricing', to: 'landing_page#pricing'

  get '/pages/components', to: 'pages#components'
  get '/pages/components_josh', to: 'pages#components_josh'
  get '/pages/dashboard', to: 'pages#dashboard'

  # Temp route to view the themes dashboard
  get 'dashboard', to: 'pages#dashboard'
  post 'dashboard', to: 'dashboard#refresh_review', as: 'refresh_review'
end
