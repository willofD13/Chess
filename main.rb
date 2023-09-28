require_relative './lib/piece.rb'
require_relative './lib/pawn.rb'
require_relative './lib/rook.rb'
require_relative './lib/knight.rb'
require_relative './lib/bishop.rb'
require_relative './lib/king.rb'
require_relative './lib/queen.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[1,3]] = Pawn.new('black',b,[1,3])
b[[1,3]].move_piece(b,[1,3],[3,3])
b[[3,3]].move_piece(b,[3,3],[4,3])
b[[4,3]].move_piece(b,[4,3],[5,3])
b[[5,3]].move_piece(b,[5,3],[6,3])
b[[6,3]].move_piece(b,[6,3],[7,3])
b.display_board
