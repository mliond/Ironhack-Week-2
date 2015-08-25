require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './lib/task'

enable :sessions

# list = ["Take out the trash",
# 			  "Walk the dog",
# 			  "Buy something to eat"]

list = []
# todo_list = []
done_list = []

get "/" do
	@list = list
	@done_list = done_list
	erb :index
end

get "/add_post" do
	new_task = Task.new(params[:new_post], list.count, true)
	list.push(new_task)
	redirect to("/")
end

post "/done" do
	delete_item_index = params[:delete_item].to_i
	list[delete_item_index].status = false
end

# post "/delete_post" do
# 	delete_item_index = params[:delete_item].to_i
# 	done_list.push(list[delete_item_index])
# 	list.delete_at(delete_item_index)
# 	redirect to("/")
# end

