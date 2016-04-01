class King 
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color
	end

	def move?(x , y)

		if (x - @x).abs > 1 || (y - @y).abs > 1
			false
		else 
			true
		end
	end

end