#lib/Car.rb

class Car
	@@total_cities = 0
	attr_accessor :name, :sound, :cities, :make, :model
	
	def initialize(name, sound, make, model)
		@sound = sound
		@name = name 
		@make = make
		@model = model
		@cities = []
		

	end
	def make_noise
		puts @sound
	end
	def visit_city(city)
		@cities.push(city)
		@@total_cities += 1
	end
	def print_cities
		cities.each { |city|
			puts city
		}
	end

end
