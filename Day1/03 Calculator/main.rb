require 'sinatra'
require 'sinatra/reloader'
require 'pry'

require_relative 'lib/calculator'

get "/" do
	erb :index
end

post "/calculate" do
	@first_number = params[:first_number].to_i
	@second_number = params[:second_number].to_i
	@method = params[:method]
	@result = Calculator.new(@first_number, @second_number, @method).calculate
	erb :index
end
