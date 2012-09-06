Rails3BootstrapDeviseCancan::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index_autenticado'
  end
  root :to => "home#index"
  devise_for :users
  resources :users, :only => [:show, :index ]
end
