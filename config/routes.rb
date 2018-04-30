Rails.application.routes.draw do
  resources :authors
  resources :books
  resource :library, only: :show do
    resources :books, only: :index, to: "books#index"
    resources :authors, only: :index, to: "authors#index"
  end
end
