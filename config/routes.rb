Rails.application.routes.draw do
  resources :mailings, only: [:new, :create, :show]

  get '/auth/linkedin/callback', to: 'auth/linkedin#callback', as: :auth_linkedin
  get '/auth/twitter/callback', to: 'auth/twitter#callback', as: :auth_twitter
  get '/auth/facebook/callback', to: 'auth/facebook#callback', as: :auth_facebook

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: :destroy_session

  get '/dashboard', to: 'dashboard#index'
  get '/dashboard/mailings/:id', to: 'dashboard#show', as: :dashboard_mailing

  root 'mailings#new'
end
