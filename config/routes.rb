Rails.application.routes.draw do
  
  resources :instituicaos
  resources :enderecos
  resources :telefones

  devise_for :usuario_nextis
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match 'welcome' => 'welcome#index', via: [:get]
  
  root "welcome#index"

end
