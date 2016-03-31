class NoisePrinter
	def printer(array)
		array.each do |vehicle|
			puts "The " + vehicle.name + " goes: " + vehicle.noise
		end
	end


end