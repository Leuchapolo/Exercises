class Bishop 
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color
	end

	def move?(x , y)

		if (x - @x).abs/(y - @y).abs == 1
			true
		else 
			false
		end
	end

end