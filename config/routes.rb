Rails.application.routes.draw do
  get 'comics(/:query)', to: 'home#comics', as: 'comics', defaults: { format: 'json' }

  root 'home#index'
end
