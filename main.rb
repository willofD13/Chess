require_relative './lib/Pawn.rb'
require_relative './lib/rook.rb'
require_relative './lib/bishop.rb'
require_relative './lib/knight.rb'
require_relative './lib/king.rb'
require_relative './lib/queen.rb'
require_relative './lib/piece.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[0,0]] = Pawn.new('black',b)
b[[0,1]] = Pawn.new('white',b)
piece = b[[0,0]]
puts piece.is_there_an_enemy?([0,1])