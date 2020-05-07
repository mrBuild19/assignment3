Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
  									sessions: 'users/sessions' }
  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'follow_index/:id' => 'relationships#follow_index', as: 'follow_index'
  get 'follower_index/:id' => 'relationships#follower_index', as: 'follower_index'
end
