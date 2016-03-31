class ShoppingCart
	
	def initialize
		@cart = {}
		@price_list = {
			"apples" => 10,
			"oranges" => 5, 
			"grapes" => 15
		}
	end

	def add(item)
		if @price_list.has_key? item
			if @cart.has_key? item
				@cart[item] = @cart[item] + 1
			else
				@cart[item] = 1
			end
		else
			puts "Invalid Item"
		end
	end

	def show
		@cart.each do |item, value|
			return_string = ""
			return_string += value.to_s + " " + item + ": $" + ((value * @price_list[item]) * discount).to_s 
			puts return_string
		end
	end

	def cost
		total_cost = 0
		@cart.each do |item, value|
			total_cost += (value * @price_list[item] * discount)
		end
		total_cost
	end

	def calc_subtotal(value, item, discount)



end