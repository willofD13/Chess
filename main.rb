require_relative './lib/piece.rb'
require_relative './lib/pawn.rb'
require_relative './lib/rook.rb'
require_relative './lib/knight.rb'
require_relative './lib/bishop.rb'
require_relative './lib/king.rb'
require_relative './lib/queen.rb'
require_relative './lib/board.rb'

b = Board.new 
rook = Rook.new('black',b,[7,0])
p rook.valid_moves([7,0],b)
