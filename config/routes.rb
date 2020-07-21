Rails.application.routes.draw do
  root to: 'users#show'
  devise_for :users

  resources :projects, only: [:index, :show, :update] do
    resources :reservations, only: [:create, :new]
    member do
      get 'favorite', to: 'projects#favorite'
    end
    resources :chatrooms, only: :show do
      resources :messages, only: :create
    end
    resources :events, only: [:index, :update, :create]
  end

  get 'my-projects', to: 'projects#myprojects'
  get 'completed-projects', to: 'projects#completedprojects'
  get 'favorites', to: 'projects#favorites'
  get 'dashboard', to: 'users#show'
  get 'tagged', to: "projects#index", as: :tagged
  get 'employees', to: "projects#employees"

end
