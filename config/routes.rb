Rails.application.routes.draw do
  
  resources :cadastros
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :colaborador, only: [:new, :create]
  post '/colaborador/new' => 'colaborador#create', :as => :create_colaborador
  
  devise_scope :user do
    get '/cadastrar_colaborador' => 'registrations_colaboradores#new', :as => :new_user_colaborador
    get '/user_registration/:token' => 'registrations#new', :as => :new_user_registration
    post '/signup' => 'registrations#create', :as => :user_registration
    post '/signin' => 'sessions#create', :as => :user_session
    get '/login' =>  'sessions#new', :as => :new_user_session
  end

  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }, skip: [:sessions]
  
  resources :instituicaos, only: [:new, :create]

  devise_for :usuario_nextis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'not-actived' => 'pages#show', via: [:get], :as => :user_not_actived, page: "not-actived"
  match 'email-validation' => 'pages#show', via: [:get], :as => :email_validation, page: "email-validation"
  match 'welcome' => 'pages#show', via: [:get], :as => :welcome, page: "welcome"
  match 'about' => 'pages#show', via: [:get], :as => :about, page: "about"
  match 'cadastrar-instituicao' => 'instituicaos#new', via: [:get], :as => :cadastrar_instituicao

  get "/:page" => "pages#show"

  root "pages#show", page: "welcome"

end
