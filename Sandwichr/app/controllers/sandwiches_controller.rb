class SandwichesController < ApplicationController
	def index 
		sandwiches = Sandwich.all
		render json:sandwiches
	end
	def create 
		sandwich = Sandwich.create(sandwich_params)
		render json: sandwich
	end

	def show 
		sandwich = load_sandwich
		return if sandwich.nil?
		render json: sandwich

	end

	def update 
		sandwich = load_sandwich
		return if sandwich.nil?
		sandwich.update(sandwich_params)
		render json: sandwich
	end

	def destroy
		sandwich = load_sandwich
		return if sandwich.nil?
		sandwich.destroy
		render json: sandwich
	end

	private 

	def load_sandwich 
		sandwich = Sandwich.find_by(id: params[:id])
		if sandwich.nil?
			render json: {error: "sandwich not found"}, status: 404
			return 
		end
		return sandwich
	end

	def sandwich_params
		params.require(:sandwich).permit(:name, :bread_type)
	end

end
