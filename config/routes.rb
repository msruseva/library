Rails.application.routes.draw do
  root to: 'auth#login'
  
  get 'login' => 'auth#login'
  post 'login' => 'auth#process_login'
  get 'logout' => 'auth#logout'

  resources :users, only: [ :new, :create, :destroy ]
  resources :books, except: [ :show, :edit, :update ] {
  	get :autocomplete_book_name, :on => :collection
  }

end
