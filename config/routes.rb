Rails.application.routes.draw do
  
  resources :relatorios
  resources :cadastros
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :colaborador, only: [:new, :create, :index]
  
  get "/perfil" => 'colaborador#show', :as => :colaborador_perfil
  post '/colaborador/new' => 'colaborador#create', :as => :create_colaborador
  get "/configuracoes-colaborador" => "colaborador#edit"
  patch "/configuracoes-colaborador" => 'colaborador#update'
  put "/configuracoes-colaborador" => 'colaborador#update', :as => :edit_colaborador

  devise_scope :user do
    delete '/users/sign_out' => 'sessions#destroy', :as => :destroy_user_session
    get '/users/sign_out' => 'sessions#destroy', :as => :destroy_user_session_get
    get '/cadastrar_colaborador' => 'registrations_colaboradores#new', :as => :new_user_colaborador
    get '/user_registration/:token' => 'registrations#new', :as => :new_user_registration
    post '/signup' => 'registrations#create', :as => :user_registration
    post '/signin' => 'sessions#create', :as => :user_session
    get '/login' => 'sessions#new', :as => :new_user_session
  end

  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }, skip: [:sessions]
  
  resources :instituicaos, only: [:new, :create]
  
  get "/configuracoes-instituicao" => "instituicaos#edit", :as => :instituicao
  patch "/configuracoes-instituicao" => "instituicaos#update"
  put "/configuracoes-instituicao" => "instituicaos#update", :as => :edit_instituicao  
  
  devise_for :usuario_nextis, only: [:sessions]

  get '/not-actived' => 'pages#show', :as => :user_not_actived, page: "not-actived"
  get '/email-validation' => 'pages#show', :as => :email_validation, page: "email-validation"
  get '/welcome' => 'pages#show', :as => :welcome, page: "welcome"
  get '/about' => 'pages#show', :as => :about, page: "about"
  get '/cadastrar-instituicao' => 'instituicaos#new', :as => :cadastrar_instituicao
  get '/download' => 'relatorios#download'
  post '/download' => 'relatorios#download'

  get "/dashboard" => "dashboard#index"
  get "/api/cadastros_mes" => "dashboard#get_cadastros_mes"
  get "/api/cadastros_semana" => "dashboard#get_cadastros_semana"
  get "/api/cadastros_colaboradores" => "dashboard#get_cadastros_colaboradores"
  get "/:page" => "pages#show"

  root "pages#show", page: "welcome"
end
