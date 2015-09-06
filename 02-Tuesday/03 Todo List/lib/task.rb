require 'pry'

class Task
	attr_accessor :content, :id, :status

	def initialize(content, id, status)
		@content = content
		@id = id
		@status = status
	end

	def change_status
		@status = @status == true ? false : true
	end

end
