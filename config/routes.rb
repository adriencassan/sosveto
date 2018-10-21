Rails.application.routes.draw do
  get 'profile/show'

  devise_for :users
  root to: redirect("/users/sign_in")
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :duties do
    resources :consultations do
      get "/pdf", to: "consultations#pdf", as: :pdf
    end
  end

  resources :events, only: [:index]

  resources :profile, only: [:show, :update]
end
