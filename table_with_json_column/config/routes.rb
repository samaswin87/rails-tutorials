Rails.application.routes.draw do
  get 'books/new'
  get 'books/create'
  get 'books/show'
  get 'books/edit'
  get 'books/index'
  resources :articles
  resources :books
  get 'articles/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
