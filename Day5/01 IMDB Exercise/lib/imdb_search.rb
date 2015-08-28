require 'imdb'
require 'awesome_print'
require 'pry'

class ImdbSearch
	def initialize
	end

	def check_imdb(keyword)
		movie_array = Imdb::Search.new(keyword).movies()
	end

	def fetch_poster_URL(movie_array)
		poster_url_arr = []

		movie_array.each do  |movie|
			break if poster_url_arr.size == 9
				url = movie.poster
				unless url == nil
					poster_url_arr << url
				end
			end

		return poster_url_arr
	end

end

