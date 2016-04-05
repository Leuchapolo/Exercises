class Knight 
	attr_accessor :type
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color

		if color == "Black"
			@type = "bN"
		elsif color == "White"
			@type = "wN"
		end
	end

	def move?(x , y)
		val_move(@x, @y, x, y)
	end

	def val_move(x1, y1, x2, y2)
		if (x2 - x1).abs == 2
			if (y2 - y1).abs == 1
				return true
			end
			false
		elsif (y2 - y1).abs == 2
			if (x2 - x1).abs == 1
				return true
			end
			false
		else
			false
		end
	end

end