Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :clients

  resources :diets, only: :create do
    member do
      get :goal
      patch :save_goal
      get :client_data
      patch :save_client_data
      get :effort
      patch :save_effort
      get :preview
    end
  end
end
