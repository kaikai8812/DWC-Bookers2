Rails.application.routes.draw do
  get 'home/about' => 'homes#about'
  devise_for :users
  root to: 'homes#top'
  resources :users, only: [:show, :index]
end
