Rails.application.routes.draw do
  resources :mailings, only: [:new, :create, :show]

  root 'mailings#new'
end
