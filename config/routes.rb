Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
  									sessions: 'users/sessions' }
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'follows' => 'relationships#follower', as: 'follows'
    get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  root 'home#top'
  get 'home/about'
end
