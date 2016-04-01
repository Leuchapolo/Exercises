class Player 
	def initialize(board)
		@board = board.board
	end

	def play_chess(moves_file)
		moves_list = IO.read(moves_file).split("\n")
		
		moves_list.each do |move|
			check_move(move[0,2], move[3,5])
		end
	end

	def check_move(start_spot, end_spot)
		x1 = start_spot[0].to_i - 1
		y1 = start_spot[1].to_i - 1 
		x2 = end_spot[0].to_i - 1
		y2 = end_spot[1].to_i - 1
		if @board[y1][x1] != "Empty" && @board[y2][x2] == "Empty"
			puts @board[y1][x1].val_move(x1, y1, x2, y2).to_s
		else
			puts false
		end
	end
end
