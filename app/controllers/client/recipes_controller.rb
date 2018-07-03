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

  def create
    # take in the parameters
    # make a web request to the API to create the new thing
    response = Unirest.post("localhost:3000/api/recipes", parameters:
      {
        input_title: params[:input_title],
        input_chef: params[:input_chef],
        input_directions: params[:input_directions],
        input_prep_time: params[:input_prep_time],
        input_ingredients: params[:input_ingredients],
        input_image_url: params[:input_image_url]
      }
    )
    @recipe = response.body
    # show the newly created recipe to the user in HTML
    render "show.html.erb"
  end
end
