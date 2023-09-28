require_relative './lib/piece.rb'
require_relative './lib/pawn.rb'
require_relative './lib/rook.rb'
require_relative './lib/knight.rb'
require_relative './lib/bishop.rb'
require_relative './lib/king.rb'
require_relative './lib/queen.rb'
require_relative './lib/board.rb'

b = Board.new 
b.add_pawns
b.add_rest_pieces
b[[0,2]] = Knight.new('black',b,[0,2])
b[[0,2]].move_piece(b,[0,2],[2,3])
b[[6,4]] = Pawn.new('white',b,[6,4])
b[[6,4]].move_piece(b,[6,4],[4,4])
b.display_board
