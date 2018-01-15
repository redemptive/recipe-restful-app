require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/recipe.rb'
require_relative './controllers/recipes_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run RecipesController