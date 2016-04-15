require 'sinatra'

get "/" do 
	'Hello World'
end

get "/real_page" do 
	'the other page'
end

get "/hi" do 
	redirect to('/real_page')
end