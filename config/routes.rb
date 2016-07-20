Rails.application.routes.draw do
  resources :mailings, only: [:new, :create, :show]

  get '/auth/linkedin/callback', to: 'auth/linkedin#callback', as: :auth_linkedin
  get '/auth/twitter/callback', to: 'auth/twitter#callback', as: :auth_twitter
  get '/auth/facebook/callback', to: 'auth/facebook#callback', as: :auth_facebook

  root 'mailings#new'
end
