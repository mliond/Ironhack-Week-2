class FileCounter
	def initialize(file)
		@file = file
	end

	def read_content
		@read_content = @file.read
	end

	def count_words
		@read_content = read_content.split.size
		@read_content
	end
end

