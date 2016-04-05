class WheelCounter
	def counter(array)
		total_wheels = 0
		array.each do |vehicle|
			total_wheels += vehicle.num_wheels
		end
		total_wheels
	end


end
