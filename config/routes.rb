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

  scope module: :public do
    get "about"=>'homes#about'
    get 'users' =>'users#show'
    get "users/edit" => "users#edit"
    patch "users" => "users#update"
    get "users/unsubscribed"=>'users#check', as: 'check'
    patch "users/withdrawal"=>'users#withdrawal', as: 'withdrawal'
    resources :lists do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
