class StringCalculator
	def add (num_string)
		nums = num_string.split(",")
		
		if nums.length <= 2
			result = 0
			nums.each do | num|
				result += num.to_i
			end
		else
			puts "String: '#{num_string}' is too long"
		end
		result
	end
end