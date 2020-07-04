Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :projects, only: [:index, :show] do
    resources :reservations, only: [:create, :new]
    member do
      get 'favorite', to: 'projects#favorite'
    end
  end

  get 'my-projects', to: 'projects#myprojects'
  get 'favorites', to: 'projects#favorites'
  get 'profile', to: 'users#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
