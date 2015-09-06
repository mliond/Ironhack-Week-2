class Lexiconomitron
	def eat_t(string)
		string.delete "tT"
	end

	def array_fun(array)
		first_word = array.first.reverse
		last_word = array.last.reverse

		new_array = [eat_t(first_word), eat_t(last_word)]
	end

	def oompa(array)
		new_array = array.delete_if {|word| word.length > 3 }
		new_array.map! {|word| eat_t(word)}
	end
end