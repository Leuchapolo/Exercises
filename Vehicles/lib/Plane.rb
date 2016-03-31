require_relative "WheelCounter.rb"
require_relative "NoisePrinter.rb"
class Plane 
	attr_reader :num_wheels, :name, :noise
	def initialize 
		@num_wheels = 4
		@name = "Plane"
		@noise = "BBBRRRRR"
	end
end