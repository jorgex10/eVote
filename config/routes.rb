Rails.application.routes.draw do

  devise_for :admins
  devise_for :users

  root "polling_processes#index"

  resources :polling_processes do
    put :set_current_process, on: :collection
  end

  namespace :admin do
    resources :users, only: :index
    resources :members, only: :index do
      get :generate, on: :collection
    end
    resources :voters, only: :index do
      post :import, on: :collection
    end
    resources :polling_stations, only: :index do
      post :create_station, on: :collection
    end
    resources :reports, only: :index
    put :delete_current_process
    root "users#index"
  end

end