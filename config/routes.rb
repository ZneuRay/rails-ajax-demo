Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'
  
  # normal
  resources :books

  # jquery
  resources :jquery_books do
    get :load_table, on: :collection
  end

  # remote
  resources :remote_books do
    get :load_table, on: :collection
  end

  # vue
  resources :vue_books
end
