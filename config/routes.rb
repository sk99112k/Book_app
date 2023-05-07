Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about"
  resources :books, only: [:new, :create, :show, :index, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    #resources :comments, only: [:create, :destroy]
  end
  post "/books/:book_id/comments" => "comments#create", as:'comments'
  delete "/books/:book_id/comments/:id" => "comments#destroy", as:'destroy_comments'
  resources :users, only: [:show, :index, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
