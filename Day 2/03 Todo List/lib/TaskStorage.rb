require 'json'

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
	# 	tempHash = {
	# 	    "content" => "content",
	# 	    "id" => "id",
	# 	    "status" => "status"
	# 	}
	# 	File.open("public/temp.json","w") do |f|
	# 	  f.write(tempHash.to_json)
	# 	end
	# end

	# def save_to_file
	# 	hash = {}
	# 	@list.each do |item|
	# 		hash


end
