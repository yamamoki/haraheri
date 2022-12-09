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
    get "about"=>'homes#about'
    resources :lists, only: [:new, :index, :show, :edit]
  end

  get "users/:id" => "public/users#show", as: "user"
  get "users/:id/edit" => "public/users#edit", as: "edit_user"
  patch "users/:id" => "public/users#update", as: "update_user"
end
