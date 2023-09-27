require_relative './lib/piece.rb'
require_relative './lib/pawn.rb'
require_relative './lib/rook.rb'
require_relative './lib/knight.rb'
require_relative './lib/bishop.rb'
require_relative './lib/king.rb'
require_relative './lib/queen.rb'
require_relative './lib/board.rb'

b = Board.new 
king = King.new('black',b,[3,3])
p king.valid_moves([3,3],b)
