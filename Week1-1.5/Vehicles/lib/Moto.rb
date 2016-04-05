require_relative "WheelCounter.rb"
require_relative "NoisePrinter.rb"
class Moto 
	attr_reader :num_wheels, :name, :noise
	def initialize 
		@num_wheels = 2
		@name = "Moto"
		@noise = "Raeehhhhhh"
	end
end