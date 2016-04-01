class Knight 
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color
	end

	def move?(x , y)
		if (x - @x).abs == 2
			if (y - @y).abs == 1
				return true
			end
			false
		elsif (y - @y).abs == 2
			if (x - @x).abs == 1
				return true
			end
			false
		else
			false
		end
	end

end