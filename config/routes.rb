Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#show'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :attendee_events, only: [:create]

  resources :events, only: [:new, :create, :index, :show]

  resources :users, only: [:new, :create, :show]
end
