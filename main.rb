require_relative './lib/pieces.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[1,3]] = King.new('black',b,[1,3])
b[[3,5]] = Queen.new('white',b,[3,5])
b[[0,2]] = Pawn.new('black',b,[0,2])
b[[0,3]] = Pawn.new('black',b,[0,3])
b[[0,4]] = Pawn.new('black',b,[0,4])
b[[2,3]] = Pawn.new('black',b,[2,3])
b[[3,2]] = Rook.new('white',b,[3,2])
b[[3,6]] = Queen.new('white',b,[3,6])
b.display_board
p b.checkmate?('black')
