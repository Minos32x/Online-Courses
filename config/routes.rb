Rails.application.routes.draw do
  resources :comments
  resources :lectures
  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "courses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end