class Client::RecipesController < ApplicationController
  def index
    response = Unirest.get("localhost:3000/api/recipes")
    @recipes = response.body
    render "index.html.erb"
  end

  def show
    recipe_id = params[:id]
    response = Unirest.get("localhost:3000/api/recipes/#{recipe_id}")
    @recipe = response.body
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end
end
