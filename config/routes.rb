Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
   get 'users/:id', to: 'users/registrations#show', as: 'user'
  end
  # get "events/new", to: 'events#new'
  # post "events", to: 'events#create'
  # get "events", to: "events#index"
  # get '/events/:id', to: 'events#show', as: 'event'
  resources :events

  resources :events, only: :show do
    resources :attendee_events, only: [:create, :destroy]
  end


  root "events#index"
end
