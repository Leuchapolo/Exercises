class StringCalculator
	def add (num_string)
		nums = num_string.split(",")
		
		result = 0
		nums.each do | num|
			result += num.to_i
		end
		
		result
	end
end