ParseRailsBoilerplate::Application.routes.draw do
  resources :categories

  resources :categoria

  resources :camino_asociados

  resources :caminos


  resources :fotos
  match "asociados/:q" => "asociados#buscar", :as => "buscar_asociados" 
  resources :asociados
    match "news/:q" => "news#buscar", :as => "buscar_news" 
  resources :news

     
  match "mensajes/:id/chat/responder" => "mensajes#responder_chat", :as => "responder_mensaje"  
  match "mensajes/:id/chat" => "mensajes#chat", :as => "mensajes_chat"  

  resources :mensajes

  get "log_in" => "sessions#new", :as => "log_in"  
  get "log_out" => "sessions#destroy", :as => "log_out"  
  
  get "sign_up" => "users#new", :as => "sign_up"  
  root :to => "users#new"  
  resources :users  
  resources :sessions 
end
