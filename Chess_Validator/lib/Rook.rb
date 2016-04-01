class Rook 
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color
	end

	def move?(x , y)
		if x == @x || y == @y
			true
		else 
			false
		end
	end

end