require "sinatra"
require_relative "lib/Calculator.rb/"

get "/" do 
	@prev = nil
	@result = nil
	erb :home
end

post "/" do 
	@prev = params[:reuse]
	@result = nil
	erb :home
end

post "/calculate" do
	@prev = nil
  first = params[:first_number].to_f
  second = params[:second_number].to_f
  op = params[:operation]
  if op == "Add"
  	@result = Calculator.new.add(first, second) 
  elsif op == "Subtract"
  	@result = Calculator.new.subtract(first, second)
  elsif op == "Multiply"
  	@result = Calculator.new.multiply(first, second)
  elsif op == "Divide"
  	@result = Calculator.new.divide(first, second)
  end
  erb :home
end

get "/calculate" do 
	redirect to("/")
end