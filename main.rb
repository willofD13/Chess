require_relative './lib.pieces.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[1,3]] = Pawn.new('black',b,[1,3])
b[[1,3]].move_piece(b,[1,3],[3,3])
b[[3,3]].move_piece(b,[3,3],[4,3])
b[[4,3]].move_piece(b,[4,3],[5,3])
b[[5,3]].move_piece(b,[5,3],[6,3])
b[[6,3]].move_piece(b,[6,3],[7,3])
b.display_board
