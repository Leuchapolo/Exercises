class ConcertsController < ApplicationController
  def index
	@todays_concerts = Concert.where("date >= :start_date AND date <= :end_date", {start_date: Time.current.midnight - 1.day , end_date: Time.current.midnight + 1.day})
	@months_concerts = Concert.where("date >= :start_date AND date <= :end_date", {start_date: Time.current.midnight - 1.day , end_date: Time.current.midnight + 1.month + 1.day})
	render 'index' 	
  end 

  def new
  	@new_concert = Concert.new

  	render 'new'
  end

  def create
  	date = params[:concert]
  	year = date["date(1i)"].to_i
  	month = date["date(2i)"].to_i
  	day = date["date(3i)"].to_i
  	hour = date["date(4i)"].to_i
  	minutes = date["date(5i)"].to_i
  	chosen_date = DateTime.new(year, month, day, hour, minutes)

  	@new_concert = Concert.create(artist: params[:concert][:artist], venue: params[:concert][:venue], city: params[:concert][:city], date: chosen_date, price: params[:concert][:price], description: params[:concert][:description])
  	if @new_concert.errors.any?
  		render 'new'
  	else 
  		redirect_to action: 'index'
  	end

  end
end