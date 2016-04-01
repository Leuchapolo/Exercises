class Pawn 
	def initialize(x, y, color)
		@x = x
		@y = y
		@color = color
	end

	def move?(x , y)
		if @color == "White"
			#needs to be y translation by 1 or 2
			if y - @y == 1 || y - @y ==2
				true
			else
				false
			end
		elsif
			#needs to be y translation by -1 or -2
			if y - @y == -1 || y - @y == -2
				true
			else
				false
			end
		end 
	end

end