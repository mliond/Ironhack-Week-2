class SaveToFile
	def save_to_file(store)
		IO.write("memory.txt", store, "a")
	end
end
