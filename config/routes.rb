Rails.application.routes.draw do
  resources :books
  root "homes#top"
  devise_for :users
  resources :users, only: [:show, :edit, :create, :index, :new, :update]
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
