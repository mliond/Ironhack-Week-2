require 'pry'

class Calculator
	def convert_to_array(numbers)
		if numbers.include? (",")
			@numbers = numbers.split(",")
		else
			@numbers = numbers.split("\n")
		end

		if @numbers.include? ("0")
			@numbers.delete("0")
		end

		@numbers.map! {|i| i.to_i }
	end

	def add(numbers)
		convert_to_array(numbers)
		@numbers.reduce(0,:+)
	end

	def multiply(numbers)

		if numbers.empty?
			0
		else
			convert_to_array(numbers)
			@numbers.reduce(:*)
		end
	end

	def power(numbers) # only up to 3 numbers as input -> 1 base + 2 exponents
		convert_to_array(numbers)
		base = @numbers[0]
		result = 1

		exponent = @numbers.count == 2 ? @numbers[1] : @numbers[1] * @numbers[2]

		exponent.times do
			result *= base
		end

		result
	end
end
