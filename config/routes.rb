Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :floofs
  resources :floof_rental_requests, only: [:new, :create]
end
