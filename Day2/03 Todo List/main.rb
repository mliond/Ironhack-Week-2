require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative './lib/task'
require_relative './lib/TaskStorage'

enable :sessions

login_data = {admin: "password", kevin: "1234", anna: "ironhack"}
my_taskstorage = TaskStorage.new


get "/" do
	if session[:logged_in] == true
		redirect to("/welcome")
	else
		erb :login
	end
end

get "/login" do
	username = params[:username].to_sym
	password = params[:password]

	if login_data[username] == password
		session[:logged_in] = true
		session[:username] = username
		redirect to("/welcome")
	else
		session[:logged_in] = false
		redirect to("/")
	end

end

get "/welcome" do
	@list = my_taskstorage.list
	@username = session[:username]

	if session[:logged_in] == true
		erb :index
	else
		redirect to("/")
	end
end

get "/clear_session" do
	session[:username] = nil
	session[:logged_in] = false
	redirect to("/")
end

get "/add_item" do
	new_task = Task.new(params[:new_post], my_taskstorage.list.count, true)
	my_taskstorage.list.push(new_task)
	redirect to("/")
end

post "/done_item" do
	done_item_index = params[:done_item].to_i
	#use instance function change_status instead?
	my_taskstorage.list[done_item_index].status = my_taskstorage.list[done_item_index].status == true ? false : true
	redirect to("/")
end

post "/delete_item" do
	delete_item_index = params[:delete_item].to_i
	my_taskstorage.list.delete_at(delete_item_index)
	redirect to("/")
end

# post "/save" do
# 	my_taskstorage.save_to_file
# 	redirect to("/")
# end

# post "/clear" do
# 	session[:save] = nil
# 	redirect to("/")
# end


