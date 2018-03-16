Rails.application.routes.draw do
	root 'static_pages#home'
	get '/signup', to:'users#new', as: 'signup'
  get '/login', to:'sessions#new', as: 'login'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  resources :users
  
  resources :categories do
    resources :words do
      resources :word_answers
  end
end

  resources :password_resets, only: [:new, :create, :edit, :update]
end