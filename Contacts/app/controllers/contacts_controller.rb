class ContactsController < ApplicationController
  def index
  	@contacts = Contact.all.order("name ASC")
  	render 'index'
  end
  def new 
  	render 'new'
  end

  def create 
  	Contact.create(name: params["contact"]["name"], email: params["contact"]["email"], number: params["contact"]["phone"], address: params["contact"]["address"])
  	redirect_to("/contacts")
  end

  def show 
  	@contact = Contact.find_by id: params[:id]
  	render "show"
  end
end
