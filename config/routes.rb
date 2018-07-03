Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :client do
    get '/recipes' => 'recipes#index'
    get '/recipes/new' => 'recipes#new'
    get '/recipes/:id' => 'recipes#show'
  end
end
