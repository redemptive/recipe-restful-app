class RecipesController < Sinatra::Base

	# sets root as the parent-directory of the current file
	set :root, File.join(File.dirname(__FILE__), '..')

	# sets the view directory correctly
	set :views, Proc.new { File.join(root, "views") }

	# Turn on Sinatra Reloader
	configure :development do
	  register Sinatra::Reloader
	end

	#Index
	get "/recipes" do

		@recipes = Recipe.all

		erb :"recipes/index"

	end

	#New
	get "/recipes/new" do

		@recipe = Recipe.new

		erb :"recipes/new"

	end

	#Show
	get "/recipes/:id" do

		id = params[:id].to_i

		@recipes = Recipe.find("id", id)
		@recipe = @recipes[0]

		erb :"recipes/show"
	end

	#Search
	post "/recipes/search" do

		@search_parameter = params[:search_parameter]
		@search_value = params[:search_value]

		@recipes = Recipe.find(@search_parameter, @search_value)

		erb :"recipes/search"
	end

	#Create
	post "/recipes" do

		recipe = Recipe.new

		recipe.name = params[:name]
		recipe.ingredients = params[:ingredients]
		recipe.method = params[:method]
		recipe.cuisine = params[:cuisine]
		recipe.portions = params[:portions]

		recipe.save

		redirect "/recipes"

	end

	#Edit
	put "/recipes/:id" do

		id = params[:id].to_i

		recipe = Recipe.find("id", id)

		recipe.name = params[:name]
		recipe.ingredients = params[:ingredients]
		recipe.method = params[:method]
		recipe.cuisine = params[:cuisine]
		recipe.portions = params[:portions]

		recipe.save

		redirect "/recipes/" + id.to_s

	end

	#Delete
	delete "/recipes/:id" do

		id = params[:id].to_i

		Recipe.destroy(id)

		redirect "/recipes"

	end

	#Edit
	get "/recipes/:id/edit" do

		id = params[:id].to_i

		@recipe = Recipe.find(id)

		erb :"recipes/edit"

	end

end