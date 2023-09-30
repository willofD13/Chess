require_relative './lib/pieces.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[1,3]] = King.new('black',b,[1,3])
b[[3,4]] = Knight.new('white',b,[3,4])
#b[[3,3]] = Bishop.new('white',b,[3,3])
b.display_board
p b.king_dir('black')