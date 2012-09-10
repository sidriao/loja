Rails3BootstrapDeviseCancan::Application.routes.draw do
  resources :pessoas

  authenticated :user do
    root :to => 'home#index_autenticado'
  end
  root :to => "home#index"
  devise_for :users

  resources :roles
  resources :users, :only => [:show, :index ]
end
