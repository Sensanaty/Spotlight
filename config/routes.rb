Rails.application.routes.draw do


  get 'reviews/new'
  get 'reviews/create'
  devise_for :users, controllers: {registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users do
    collection do
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

  root :to => 'landing_page#landing_page'

  get '/dashboard/feed', to: 'dashboard#feed'
  get '/dashboard/explore', to: 'dashboard#explore'

  get '/landing_page/how-it-works', to: 'landing_page#how_it_works'
  get '/landing_page/pricing', to: 'landing_page#pricing'

  get '/pages/components', to: 'pages#components'
  get '/pages/components_josh', to: 'pages#components_josh'
  get '/pages/dashboard', to: 'pages#dashboard'

  # Temp route to view the themes dashboard
  get 'dashboard', to: 'pages#dashboard'
end
