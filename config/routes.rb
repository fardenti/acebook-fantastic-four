Rails.application.routes.draw do
  get '/posts' => 'posts#index'
  get '/posts/new' => 'posts#new'
  get '/posts/:id' => 'posts#edit'
  post '/user/:user_id/posts/:id/edit' => 'posts#update'
  post 'posts' => 'posts#create'

  resources :user, only: [:show] do
    resources :posts, only: [:new, :create, :index, :update, :edit]
  end

  devise_for :users
  root 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
