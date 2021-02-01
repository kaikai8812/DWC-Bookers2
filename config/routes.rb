Rails.application.routes.draw do
  get 'home/about' => 'homes#about'

  

  # 新規登録、サインイン後のリダイレクト先を決めるタメのやつ
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  # 新規登録、サインイン後のリダイレクト先を決めるタメのやつ

  root to: 'homes#top'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
end
