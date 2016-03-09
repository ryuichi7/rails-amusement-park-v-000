Rails.application.routes.draw do
	resources :users
	resources :attractions
	resources :sessions, only: [:destroy]
	resources :rides, only: [:new, :create]

	get "signin" => "sessions#new"
	post "signin" => "sessions#create"
	
	root "welcome#index"

	get '*a', to: 'application#raise_not_found'


end