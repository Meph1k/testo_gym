Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :clients

  resources :diets, only: :create do
    member do
      post :submit_plan
      patch :submit_plan
      post :discard_plan
      patch :discard_plan
      get :goal
      patch :save_goal
      get :client_data
      patch :save_client_data
      get :effort
      patch :save_effort
      get :profile
      get :preview
    end
  end
end
