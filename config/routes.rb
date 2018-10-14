Rails.application.routes.draw do
  devise_for :users
  root to: redirect("/users/sign_in")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :gardes do
    resources :consultations
  end

  resources :events, only: [:index]
end
