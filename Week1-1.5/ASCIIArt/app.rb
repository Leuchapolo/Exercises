require "sinatra"
require "artii"

get "/ascii/:word/?:font?/?:secret?" do
	if params[:word] == 'unicorn' && params[:font] == 'special' && params[:secret] == 'secret'
		erb :unicorn
	else
		if params[:font] != nil 
			font = params[:font]
		else
			font = "alligator"
		end
		a = Artii::Base.new :font => font
		@word = a.asciify(params[:word])
		erb :ascii 
	end
end

