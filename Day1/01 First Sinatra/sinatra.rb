require 'sinatra'
require 'sinatra/reloader'

# set :bind, '0.0.0.0'

get "/" do
	erb :index
end

post "/say_name" do
  "Hi #{params[:name]}!"
end