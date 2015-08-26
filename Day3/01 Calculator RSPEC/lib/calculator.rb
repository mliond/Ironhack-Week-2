class Calculator
	def initialize(string)
		@numbers = string.split(",")
		@numbers.map! {|i| i.to_i }
	end

	def add
		@numbers.reduce(:+)
	end
end

calculator = Calculator.new("4,5")
puts calculator.add