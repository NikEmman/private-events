Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
   get 'users/:id', to: 'users/registrations#show', as: 'user'
  end
  get "events/new", to: 'events#new'
  post "events", to: 'events#create'
  get "events", to: "events#index"

   root "events#index"
end
