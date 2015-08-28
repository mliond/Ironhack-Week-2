require 'imdb'

class ImdbSearch
	def initialize
	end

	def check_for_movies(keyword)
		i = Imdb::Search.new("Star Trek")
