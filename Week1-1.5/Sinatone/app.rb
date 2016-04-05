require "sinatra"



get "/" do 
	@greeting = "Wassup Girlllll"
	erb :home
end
get "/home" do 
	@greeting = "Wassup Girlllll"
	erb :home
end

get "/ago/:hours_ago" do 
	@time = (Time.new - (params[:hours_ago].to_i * 3600)).strftime("The time #{params[:hours_ago]} hour(s) ago was %l:%M")
	erb :ago
end

get "/about" do 

	erb :about
end
