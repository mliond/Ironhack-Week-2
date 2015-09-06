require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'time'

enable :sessions

get "/time/:direction/:number" do
	difference = params[:number].to_i
	seconds = difference * 60 * 60

	direction = params[:direction]

	# value = condition 				 ? if true 						: if false
	time = direction == "before" ? Time.now - seconds : Time.now + seconds

	@formatted_time = time.strftime("%H : %M : %S")
	erb :index
end

