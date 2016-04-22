class ProductsController < ApplicationController
	def index 
		if logged_in
			if params[:user_id] == nil
				@products = Product.all
			else 
				user = User.find_by(id: params[:user_id])
				@products = user.products.all
			end
			render 'index'
		else 
			render 'no_login'
		end
	end

	def new 
		@product = Product.new
		render 'new'
	end

	def create
		id = params[:id]
		title = params[:product][:title]
		description = params[:product][:description]
		deadline = Date.civil(params[:product][:start_date][:year].to_i, params[:product][:start_date][:month].to_i, params[:product][:start_date][:day].to_i)
		User.find(id).products.create(title: title, description: description, deadline: deadline)
		redirect_to("/")

	end

	def show 
		@product = Product.find_by(id: params[:id])
		@bid = Bid.new
		render 'show'
	end

	private 
	def logged_in
		session[:user_id] != nil
	end

end
