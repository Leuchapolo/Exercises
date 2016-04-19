class SiteController < ApplicationController

	def home 
		render 'home' #name of view template
	end

	def contact
		render 'contact'
	end

	def say_name
		@name = params[:name]
		render 'say_name'
	end

	def calculator 
		render 'calculator'
	end

	def calculate 
		first_num = params["first_num"]
		second_num = params["second_num"]
		@result = first_num.to_f + second_num.to_f
		render 'calculate'
	end

end
