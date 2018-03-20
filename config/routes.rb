Rails.application.routes.draw do
	root 'static_pages#home'
	get '/signup', to:'users#new', as: 'signup'
  get '/login', to:'sessions#new', as: 'login'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'

  get '/user/categories', to: 'user_categories#index'

  resources :users
  
    resources :categories, :path => 'admin/categories' do
      resources :words do
        resources :word_answers
      end
    end
  
  resources :password_resets, only: [:new, :create, :edit, :update]
end