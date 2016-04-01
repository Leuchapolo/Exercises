class Pawn 
	attr_accessor :type
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color

		if color == "Black"
			@type = "bP"
		elsif color == "White"
			@type = "wP"
		end
	end

	def move?(x , y)
		val_move(@x, @y, x, y)
	end

	def val_move(x1, y1, x2, y2)
		if x2 == x1
			if @color == "White"
				#needs to be y translation by 1 or 2
				if y2 - y1 == 1 || y2 - y1 ==2
					true
				else
					false
				end
			else
				#needs to be y translation by -1 or -2
				if y2 - y1 == -1 || y2 - y1 == -2
					true
				else
					false
				end
			end 
		else
			false
		end
	end

end