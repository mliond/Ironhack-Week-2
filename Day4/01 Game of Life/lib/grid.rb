require './cell.rb'
require 'pry'
require 'awesome_print'

class Grid
	def initialize
		@grid = 			[[1,1,0,0,0,0,0,0],
						 			 [1,0,0,0,1,1,0,0],
						 			 [1,0,1,0,1,1,1,1],
						 			 [1,1,0,0,1,1,1,1],
						 			 [1,0,0,0,0,0,0,0],
						 			 [1,0,0,0,1,1,0,0],
						 			 [1,0,0,0,1,1,1,1],
						 			 [1,0,0,0,1,1,1,1]]
	end

	def iterate_through_grid
		ap @grid

		# @grid.each_with_index do |row, xnd|
		# 	row.each_with_index do |column, ynd|
		# 		new_state = create_neighbor_array(column, xnd, ynd)
		# 		column = new_state
		# 	end
		# end

		puts create_neighbor_array(1, 2, 2)


		ap @grid
	end

	def create_neighbor_array(column, xnd, ynd)
		i = xnd
		k = ynd
		state = column

		if i == 0
			neighbor_array = [@grid[i][k-1],@grid[i][k+1],@grid[i+1][k-1],@grid[i+1][k],@grid[i+1][k+1]]
		elsif k == 0

			neighbor_array =
		# cell_position = [i][k]
		neighbor_array = [@grid[i-1][k-1], @grid[i-1][k], @grid[i-1][k+1], @grid[i][k+1], @grid[i+1][k+1], @grid[i+1][k], @grid[i+1][k-1], @grid[i][k-1]]
		check_a_cell(state, neighbor_array)
	end

	def check_a_cell(state, neighbor_array)
		Cell.new(state, neighbor_array).regenerate
	end
end

Grid.new.iterate_through_grid