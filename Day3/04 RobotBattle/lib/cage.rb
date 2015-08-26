require_relative './robots.rb'

class Cage
	def initialize
		@fighterA = Robots.new(200)
		@fighterB = Robots.new(200)
	end

	def show_cage
		cage_content = {fighterA: @fighterA.life, fighterB: @fighterB.life}
	end

end
