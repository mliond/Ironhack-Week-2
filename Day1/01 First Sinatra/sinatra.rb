require 'sinatra'
require 'sinatra/reloader'
require 'date'
require_relative './lib/FileCounter'

num_words = nil

get "/say_name" do
	erb :index
end

post "/say_name" do
  "Hi #{params[:name]}!"
end

get "/date" do
	@current_time = Time.now.strftime("Today is %A, the %d of %B.")
	erb :date
end

get "/count_words" do
	@num_words = num_words
	erb :upload
end

post "/count_words" do
	tempfile = params[:my_file][:tempfile]
	num_words = FileCounter.new(tempfile).count_words
	redirect to "/count_words"
end
