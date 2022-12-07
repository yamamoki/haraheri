Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  
  namespace :admin do
    root to: "homes#top"
    resources :users, only: [:index, :show, :edit]
    resources :genres, only: [:index, :edit]
    resources :lists, only: [:index, :show]
  end

  namespace :public do
    get 'about'=>"homes#about"
    resources :users, only: [:show, :edit, :check]
    resources :lists, only: [:new, :index, :show, :edit]
  end

end
