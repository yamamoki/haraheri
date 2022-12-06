Rails.application.routes.draw do

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'lists/index'
    get 'lists/show'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/check'
  end
  namespace :public do
    get 'lists/index'
    get 'lists/new'
    get 'lists/show'
    get 'lists/edit'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :user,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :admin do
  end
  scope module: :public do
    root :to =>"homes#top"
  end


end
