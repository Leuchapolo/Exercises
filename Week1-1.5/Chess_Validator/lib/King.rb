class King 
	attr_accessor :type
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color

		if color == "Black"
			@type = "bK"
		elsif color == "White"
			@type = "wK"
		end
	end

	def move?(x , y)
		val_move(@x, @y, x, y)

	end

	def val_move(x1, y1, x2, y2)
		if (x2 - x1).abs > 1 || (y2 - y1).abs > 1
			false
		else 
			true
		end
	end

end