Rails.application.routes.draw do
  get 'comics(/:query)', to: 'home#comics', as: 'comics'

  root 'home#index'
end
