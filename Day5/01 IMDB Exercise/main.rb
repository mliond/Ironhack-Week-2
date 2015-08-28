require 'sinatra'
require 'sinatra/reloader'
require 'pry'

get "/time/:direction/:number" do

	erb :index
end