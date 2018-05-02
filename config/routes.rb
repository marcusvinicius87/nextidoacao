Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  	sessions: 'users/sessions'
  }
 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  resources :instituicaos
  resources :enderecos
  resources :telefones

  devise_for :usuario_nextis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'welcome' => 'welcome#index', via: [:get]
  
  root "welcome#index"
  
end
