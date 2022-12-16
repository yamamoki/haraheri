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
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit]
    resources :lists, only: [:index, :show] do
      resources :post_comments, only: [:destroy]
    end
  end

  scope module: :public do
    get "about"=>'homes#about'
    get 'users' =>'users#show'
    get "users/edit" => "users#edit"
    patch "users" => "users#update"
    get "users/unsubscribed"=>'users#check', as: 'check'
    patch "users/withdrawal"=>'users#withdrawal', as: 'withdrawal'
    get 'searches' => 'lists#search'
    resources :lists do
      resources :favorites, only: [:index]
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
