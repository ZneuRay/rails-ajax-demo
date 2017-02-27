Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'
  
  resources :books
  resources :jquery_books do
    get :load_table, on: :collection
  end
  resources :remote_books do
    get :load_table, on: :collection
  end
end
