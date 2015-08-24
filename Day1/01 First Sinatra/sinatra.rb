require 'sinatra'
require 'sinatra/reloader'
require 'date'

# set :bind, '0.0.0.0'

get "/" do
	@current_time = Time.now.strftime("Today is %A, the %d of %B.")
	erb :upload
end

post "/" do
	tempfile = params[:file]
	"Uploaded tempfile #{tempfile.inspect}"
end

post "/say_name" do
  "Hi #{params[:name]}!"
end