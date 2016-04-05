class Board
	attr_accessor :board
	def initialize(board)
		@board = load_board(board)
	end

	def print_board
		
		@board.each do |row|
			return_string = ""
			row.each do |cell|
				if cell != "Empty"
					return_string += cell.type + " "
				else
					return_string += "-- "
				end
			end
			puts return_string
		end
	end

	def load_board(board)
		end_board = []
		rows = IO.read(board).split("\n")
		rows.each_with_index do |row, index|
			
			end_board[7 - index] = []
			cells = row.split(" ")
			color = ""
			
			cells.each_with_index do |cell, i|
				if cell[0] == "-"
					end_board[7 - index][i] = "Empty"
				elsif cell[0] == "b"
					color = "Black"
				elsif cell[0] == "w"
					color = "White"
				end
				if cell[1] == "P"
					end_board[7 - index][i] = Pawn.new( i, 7 -index, color)
					
				elsif cell[1] == "R"
					end_board[7 - index][i] = Rook.new( i, 7 - index, color)
				elsif cell[1] == "K"
					end_board[7 - index][i] = King.new( i, 7 - index, color)
				elsif cell[1] == "N"
					end_board[7 - index][i] = Knight.new( i, 7 - index, color)
				elsif cell[1] == "B"
					end_board[7 - index][i] = Bishop.new( i, 7 - index, color)
				elsif cell[1] == "Q"
					end_board[7 - index][i] = Queen.new( i, 7 - index, color)	
				end
			end
		
		end
		end_board
	end
end