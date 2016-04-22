class UsersController < ApplicationController
  def login
  	@user = User.new
  	render 'login'
  end

  def create
  	@user = User.new
  	@current_user = User.find_by(email: params[:user][:email])
  	if (@current_user != nil) && (@current_user.password == params[:user][:password])
	  	session[:user_id] = @current_user.id
	  	redirect_to "/products"
	  	
	else 
		@current_user = "Invalid"
		render 'login'
	end
  end
end
