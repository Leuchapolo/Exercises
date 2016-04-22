class BidsController < ApplicationController
  def create
  	@product = Product.find_by(id: params[:product_id])
  	user = User.find_by(email: params[:email])
  	if user != nil 
  		user_id = user.id
  	else 
  		user_id = -2
  	end
  	@bid = @product.bids.new(user_id: user_id, amount: params[:bid][:amount])
  	if @bid.save
		redirect_to "/users/#{@product.user.id}/products/#{@product.id}"
	else
		render "products/show"
	end
  end
end
