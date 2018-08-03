Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :client do
    get '/recipes' => 'recipes#index'
    get '/recipes/new' => 'recipes#new'
    get '/recipes/:id' => 'recipes#show'
    post '/recipes' => 'recipes#create'
    get '/recipes/:id/edit' => 'recipes#edit'
    patch '/recipes/:id' => 'recipes#update'
    delete '/recipes/:id' => 'recipes#destroy'

    get "/signup" => "users#new"
    post "/users" => "users#create"
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
  end
end
