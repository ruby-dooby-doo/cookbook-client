class Client::RecipesController < ApplicationController
  def index
    user_input = params[:client_search]
    response = Unirest.get("localhost:3000/api/recipes",
      parameters: {
        search: user_input
      }
    )
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
    flash[:success] = "You made a new recipe"
    # show the newly created recipe to the user in HTML
    redirect_to "/client/recipes/#{@recipe['id']}"
  end

  def edit
    # show the dang form
    recipe_id = params[:id]
    response = Unirest.get("localhost:3000/api/recipes/#{recipe_id}")
    @recipe = response.body
    render "edit.html.erb"
  end

  def update
    # take in params from the form
    client_params = {
      input_title: params[:input_title],
      input_chef: params[:input_chef],
      input_directions: params[:input_directions],
      input_prep_time: params[:input_prep_time],
      input_ingredients: params[:input_ingredients],
      input_image_url: params[:input_image_url]
    }
    # make a unirest request to send the params to the API
    response = Unirest.patch("localhost:3000/api/recipes/#{params[:id]}",parameters: client_params)
    # show the updated recipe
    @recipe = response.body
    flash[:success] = "You updated a currently existing recipe"
    redirect_to "/client/recipes/#{@recipe['id']}"
  end

  def destroy
    # get the recipe
    recipe_id = params[:id]
    # delete the recipe from the db
    response = Unirest.delete("localhost:3000/api/recipes/#{recipe_id}")
    flash[:danger] = "You just deleted a recipe"
    redirect_to "/client/recipes"
  end
end
