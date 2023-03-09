Rails.application.routes.draw do
  root 'sessions#new' 
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: %i[new create edit update destroy show] 
  resources :sessions, only: %i[new create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
