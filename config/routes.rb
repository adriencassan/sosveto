Rails.application.routes.draw do
  get 'gardes/index'

  devise_for :users
  root to: "gardes#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gardes do
     resources :consultations
  end
end
