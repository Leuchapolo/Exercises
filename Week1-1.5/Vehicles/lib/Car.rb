require_relative "WheelCounter.rb"
require_relative "NoisePrinter.rb"
class Car
	attr_reader :num_wheels, :name, :noise 
	def initialize 
		@num_wheels = 4
		@name = "Car"
		@noise = "BROOMMMMMMM"
	end
end