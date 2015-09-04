require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative 'lib/imdb_search.rb'

get "/" do
	erb :index
end

get "/look" do
	imdb = ImdbSearch.new
	imdb_list = imdb.check_imdb_for_keyword(params[:keyword])
	@movie_infos = imdb.get_movie_info(imdb_list)
	@keyword = params[:keyword]
	erb :poster_site
end


