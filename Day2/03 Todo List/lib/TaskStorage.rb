require 'Marshal'

class TaskStorage
	attr_accessor :list


	def initialize
		@list = []
	end

	# def load_from_file
	# 	@list = Marshal.load
	# 	File.read('save.txt')
	# end

	# def save_to_file
	# 	serialized_array = Marshal.dump(@list)
	# 	File.open('save.txt', 'w') {|f| f.write(serialized_array) }
	# end

end
