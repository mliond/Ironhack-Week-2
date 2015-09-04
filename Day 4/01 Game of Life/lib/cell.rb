class Cell
  def initialize(state, neighbours)
    @state = state # either 1 or 0 for alive or dead
    @neighbours = neighbours # an array that represents the surrounding cells
  end

  def regenerate
		@number_neighbors = @neighbours.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }

    if @state == 1
    	check_life_cell
  	elsif @state == 0
  		check_dead_cell
  	end

  	@state
	end

	def check_life_cell
		case @number_neighbors[1]
			when (0..1)
				@state = 0
			when (2..3)
				@state = 1
			when (4..@neighbours.count) # needs to be more than
				@state = 0
		end
	end

	def check_dead_cell
		case @number_neighbors[1]
			when (0..1)
				@state = 0
			when 3
				@state = 1
			when (4..@neighbours.count)
				@state = 0
		end
	end

end

Cell.new(1, [1,0,0,0]).regenerate