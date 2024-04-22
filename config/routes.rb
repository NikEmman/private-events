Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
   get 'users/:id', to: 'users/registrations#show', as: 'user'
  end
  get "events/new", to: 'events#new'
  post "events", to: 'events#create'
  get "events", to: "events#index"
  get '/events/:id', to: 'events#show', as: 'event'

  resources :events, only: :show do

    # create the route: POST /opportunities/:opportunity_id/opportunity_enrolments
    # helper: opportunity_opportunity_enrolments_path(opportunity || opportunity_id)
    # handled by: OpportunityEnrolmentsController#create
    resources :attendee_events, only: :create
  end


  root "events#index"
end
