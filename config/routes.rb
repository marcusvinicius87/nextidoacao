Rails.application.routes.draw do
  
  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'registrations'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_scope :user do
    get '/user_registration/:token' => 'registrations#new'
  end

  resources :enderecos
  resources :telefones
  resources :instituicaos

  devise_for :usuario_nextis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'welcome' => 'welcome#index', via: [:get]
  
  root "welcome#index"
  
end
