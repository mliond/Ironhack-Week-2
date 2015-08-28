require 'imdb'
require 'awesome_print'
require 'pry'

class ImdbSearch
	def check_imdb_for_keyword(keyword)
		Imdb::Search.new(keyword).movies()
	end

	def get_movie_info(movie_array)
		specific_infos = []
		movie_array.each do  |movie|
			break if specific_infos.size == 9
				unless movie.poster == nil
					specific_infos << [movie.title, movie.poster, movie.rating] # imdb gem functions
				end
			end
		return specific_infos
	end

end
