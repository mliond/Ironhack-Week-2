require 'sinatra'
require 'sinatra/reloader'
require 'pry'

enable :sessions

login_data = {admin: "password", kevin: "1234", anna: "ironhack"}

get "/" do

	if session[:logged_in] == true
		redirect to("/welcome")
	else
		erb :index
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
	@username = session[:username]

	if session[:logged_in] == true
		erb :welcome
	else
		redirect to("/")
	end
end

get "/clear_session" do
	session[:username] = nil
	session[:logged_in] = false
	redirect to("/")
end
