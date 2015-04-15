Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  resources :homes
  resources :availabilities
  resources :selectdates
  resources :events
  resources :attendees
  resources :tasks

  resources :events do
    resources :messages
  end

  delete '/availabilities' => 'availabilities#dump'
end
