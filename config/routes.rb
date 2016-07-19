Rails.application.routes.draw do
  resources :mailings, only: [:new, :create, :show]

  get '/auth/linkedin/callback', to: 'auth/linkedin#callback', as: :auth_linkedin

  root 'mailings#new'
end
