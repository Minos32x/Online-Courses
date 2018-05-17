Rails.application.routes.draw do
  resources :lectures do
    member do
      get 'spam' => 'lectures#spam'
      get 'vote' => 'lectures#vote'
      post :comment
      delete :comment_delete
    end
  end
  resources :courses
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'courses#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
