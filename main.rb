require_relative './lib/pieces.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[1,3]] = Pawn.new('black',b,[1,3])
b.move_piece([1,3],[3,3])
b.display_board
