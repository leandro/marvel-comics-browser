Rails.application.routes.draw do
  defaults format: :json do
    resources :comics, only: %w(index)
  end

  root 'home#index'
end
