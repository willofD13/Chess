require_relative './lib/piece.rb'
require_relative './lib/pawn.rb'
require_relative './lib/rook.rb'
require_relative './lib/knight.rb'
require_relative './lib/bishop.rb'
require_relative './lib/king.rb'
require_relative './lib/queen.rb'
require_relative './lib/board.rb'

b = Board.new 
pawn = Pawn.new('black',b,[1,5])
pawn2 = Pawn.new('white',b,[2,4])
b[[2,4]] = pawn2
p pawn.valid_moves([1,5],b)
