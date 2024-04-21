Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
   get 'users/:id', to: 'users/registrations#show', as: 'user'
  end

   root "events#index"
end
