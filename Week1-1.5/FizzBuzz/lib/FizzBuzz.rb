class FizzBuzz
	def fizz(num)
		if num % 3 == 0 && num % 5 == 0
			return "FizzBuzz"
		elsif num % 3 == 0 
			return "Fizz"
		elsif num % 5 == 0
			return "Buzz"
		end
		num
	end
end