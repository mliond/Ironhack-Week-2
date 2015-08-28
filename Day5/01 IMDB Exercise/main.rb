require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative 'lib/imdb_search.rb'

get "/" do
	erb :index
end

get "/look" do
	imdb = ImdbSearch.new
	movie_array = imdb.check_imdb(params[:keyword])
	@url_array = imdb.fetch_poster_URL(movie_array)
	erb :poster_site
end

