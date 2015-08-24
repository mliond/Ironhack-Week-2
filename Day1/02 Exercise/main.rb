require 'sinatra'
require 'sinatra/reloader'
require 'pry'

phrases = ["Unpleasant nor diminution excellence apartments imprudence the met new.",
					 "Draw part them he an to he roof only. Music leave say doors him. Tore bred form if sigh case as do.",
					 "Staying he no looking if do opinion.",
					 "Sentiments way understood end partiality and his."]

get "/show" do
	@phrases = phrases
	@random_phrase = @phrases[rand(0..(@phrases.count-1))]
	erb :index
end

get "/add" do
	@phrases = phrases
	@phrases.push(params[:new_phrase])
	redirect to "/show"
end

get "/showall" do
	@phrases = phrases
end
