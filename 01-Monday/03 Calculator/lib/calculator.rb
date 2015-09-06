class Calculator
	def initialize(first_number, second_number, method)
		@first_number = first_number
		@second_number = second_number
		@method = method
	end

	def calculate
		case @method
			when "+"
				return @first_number + @second_number
			when "-"
				return @first_number - @second_number
			when "*"
				return @first_number * @second_number
			when "/"
				return @first_number / @second_number
		end
	end
end