Rails.application.routes.draw do
  devise_for :users
  root to: 'landing_page#landing_page'

  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

