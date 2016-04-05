require_relative "lib/WheelCounter.rb"
require_relative "lib/NoisePrinter.rb"
require_relative "lib/Plane.rb"
require_relative "lib/Car.rb"
require_relative "lib/Moto.rb"


vehicles = [Car.new, Plane.new, Moto.new]

puts WheelCounter.new.counter(vehicles)
NoisePrinter.new.printer(vehicles)
