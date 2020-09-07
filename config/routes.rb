Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/events', to: 'events#index'
  post '/events', to: 'events#create'
  get '/events/:id', to: 'events#show'
  get '/events/actors/:actor_id', to: 'events#show_by_actor'
  get '/actors', to: 'actors#index'
  post '/actors', to: 'actors#create'
  put '/actors', to: 'actors#update'
  post '/repositories', to: 'repositories#create'
  delete '/erase', to: 'events#erase'
end
