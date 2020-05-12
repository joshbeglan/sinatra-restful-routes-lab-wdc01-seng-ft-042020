class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get "/recipes" do
    #homepage/index
    erb :index
  end

  get "/recipes/new" do
    #homepage/index
    erb :new
  end

  post "/recipes" do
    name = params["name"]
    ingredients = params["ingredients"]
    cooktime = params["cooktime"]

    recipe = Recipe.create(name: name,ingredients: ingredients, cooktime: cooktime.to_i)

    redirect "/recipes/#{recipe.id}"
  end

  get "/recipes/:id" do
    
    id = params["id"]
    @recipe = Recipe.find(id)

    erb :show
  end

  get "/recipes/:id/edit" do
    id = params["id"]
    @recipe = Recipe.find(id)

    erb :edit
  end

  patch "/recipes/:id" do
    
    recipe = Recipe.find(params["id"])

    name = params["name"]
    ingredients = params["ingredients"]
    cooktime = params["cooktime"]

    recipe.update(name: name, ingredients: ingredients, cooktime: cooktime.to_i)

    redirect "/recipes/#{params["id"]}"
  end

end
