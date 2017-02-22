Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboard#index'
  
  resources :books
  resources :jquery_books
  resources :remote_books
end
