class Rook 
	attr_accessor :type
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color

		if color == "Black"
			@type = "bR"
		elsif color == "White"
			@type = "wR"
		end
	end

	def move?(x , y)
		val_move(@x, @y, x, y)
	end

	def val_move(x1, y1, x2, y2)
		if x2 == x1 || y2 == y1
			true
		else 
			false
		end
	end

end