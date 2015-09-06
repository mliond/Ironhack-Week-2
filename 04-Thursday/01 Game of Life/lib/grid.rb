require './cell.rb'
require 'pry'
require 'awesome_print'

class Grid
	def initialize
		@grid = 			[[0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0],
									 [0,1,1,1,0,0,0,0],
									 [0,0,0,0,0,0,0,0],
									 [0,1,0,1,0,0,0,0],
									 [0,0,1,0,0,1,0,0],
									 [0,0,0,0,0,0,0,0],
									 [0,0,0,0,0,0,0,0]]
	end

	def iterate_through_grid

		next_generation = []
			@grid[(1..6)].each_with_index do |row, i|
				row[i] = []
				row[(1..6)].each_with_index do |value, k|
					array = create_neighbor_array(i, k)
					# binding.pry
					new_state = check_a_cell(value, array)
					row[i] << new_state
				end
				next_generation << row[i]
			end

		ap next_generation
	end

	def create_neighbor_array(i, k)
	 # 	i += 1
		# k += 1

		neighbor_array = [@grid[i-1][k-1], @grid[i-1][k], @grid[i-1][k+1], @grid[i][k+1], @grid[i+1][k+1], @grid[i+1][k], @grid[i+1][k-1], @grid[i][k-1]]
		neighbor_array
	end

	def check_a_cell(state, neighbor_array)
		Cell.new(state, neighbor_array).regenerate
	end
end

Grid.new.iterate_through_grid