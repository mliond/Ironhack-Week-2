class Calculator
	def initialize(string)
		@numbers = string.split(",")
		@numbers.map! {|i| i.to_i }
	end

	def add
		@numbers.reduce(0,:+)
	end
end