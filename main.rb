require_relative './lib/pieces.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[1,3]] = Pawn.new('black',b,[1,3])
b[[2,4]] = King.new('white',b,[2,4])
puts b.check?('white')
