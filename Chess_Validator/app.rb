require_relative "lib/Rook.rb"
require_relative "lib/King.rb"
require_relative "lib/Bishop.rb"
require_relative "lib/Knight.rb"
require_relative "lib/Queen.rb"

wr_left = Rook.new(1, 1, "White")
wking = King.new(5, 1, "White")
wb_left = Bishop.new(3 , 1, "White")
wk_left = Knight.new(2, 1, "White")
wqueen = Queen.new(4, 1, "White")

# puts "Rook move " + wr_left.move?(3, 1).to_s
# puts "King move " + wking.move?(6, 1).to_s
# puts "Bishop move " + wb_left.move?(4, 2).to_s
# puts "Bad Bishop move " + wb_left.move?(3, 5).to_s
# puts "Knight move " + wk_left.move?(1, 3).to_s
# puts "Bad Knight move " + wk_left.move?(4, 3).to_s
# puts "Queen move " + wqueen.move?(6, 1).to_s
# puts "Bad Queen move " + wqueen.move?(3, 3).to_s




