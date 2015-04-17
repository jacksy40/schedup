Rails.application.routes.draw do
  root 'events#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :availabilities, only: [ :new, :create, :update, :destroy ]
  resources :selectdates, only: [ :new, :create, :index ]
  resources :events, only: [ :new, :create, :show ]
  resources :attendees, only: [ :create, :destroy ]
  resources :tasks

  resources :events do
    resources :messages
  end
end
