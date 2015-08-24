require 'sinatra'
require 'sinatra/reloader'
require 'pry'

phrases = ["Unpleasant nor diminution excellence apartments imprudence the met new.",
					 "Draw part them he an to he roof only. Music leave say doors him. Tore bred form if sigh case as do.",
					 "Staying he no looking if do opinion.",
					 "Sentiments way understood end partiality and his."]
list = nil

get "/" do
	@random_phrase = phrases.sample
	@list = list
	erb :index
end

get "/add" do
	phrases.push(params[:new_phrase])
	redirect to "/"
end

get "/showall" do
	@list = phrases
	@random_phrase = @list.sample
	erb :index
end

post "/delete" do
	phrases.delete(params[:delete_phrase])
	redirect to "/showall"
end

