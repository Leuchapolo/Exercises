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
			end_board[index] = []
			cells = row.split(" ")
			color = ""
			
			cells.each_with_index do |cell, i|
				if cell[0] == "-"
					end_board[index][i] = "Empty"
				elsif cell[0] == "b"
					color = "Black"
				elsif cell[0] == "w"
					color = "White"
				end
				if cell[1] == "P"
					end_board[index][i] = Pawn.new(9-(index+1), (i + 1), color)
				elsif cell[1] == "R"
					end_board[index][i] = Rook.new(9-(index+1), (i + 1), color)
				elsif cell[1] == "K"
					end_board[index][i] = King.new(9-(index+1), (i + 1), color)
				elsif cell[1] == "N"
					end_board[index][i] = Knight.new(9-(index+1), (i + 1), color)
				elsif cell[1] == "B"
					end_board[index][i] = Bishop.new(9-(index+1), (i + 1), color)
				elsif cell[1] == "Q"
					end_board[index][i] = Queen.new(9-(index+1), (i + 1), color)	
				end
			end
		
		end
		end_board
	end
end