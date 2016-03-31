require_relative "Car.rb"

class CarDealer
	def initialize(inventory)
		@inventory = inventory 
	end

	def cars(brand_name)
		return_string = brand_name + ": "
		@inventory[brand_name].each do |car|
			return_string += car.model + ", "
		end
		puts return_string
	end


end
