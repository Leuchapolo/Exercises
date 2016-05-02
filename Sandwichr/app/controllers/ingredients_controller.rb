class IngredientsController < ApplicationController

	def create 
		ingred = Ingredient.create(ingred_params)
		render json: ingred
	end

	def destroy
		ingred = Ingredient.find_by(id: params[:id])
		if ingred.nil?
			render json: {error: "Ingredient Not found"}, status: 404
			return
		end
		ingred.destroy
		render json: ingred
	end

	def show 
		ingred = Ingredient.find_by(id: params[:id])
		if ingred.nil?
			render json: {error: "Ingredient Not found"}, status: 404
			return
		end
		render json: ingred
	end

	private

	def ingred_params
		params.require(:ingredient).permit(:name, :calories)
	end

end
