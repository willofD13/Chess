require_relative './lib/pieces.rb'
require_relative './lib/board.rb'

b = Board.new 
b[[0,4]] = Rook.new('black',b,[0,4])
b[[0,3]] = Queen.new('black',b,[0,3])
b[[2,4]] = King.new('white',b,[2,4])
b[[0,5]] = Queen.new('black',b,[0,5])
#p b.check?('white')
#p b.go_away?('white')
b[[4,3]] = Queen.new('black',b,[4,3])
b[[4,5]] = Queen.new('black',b,[4,5])
b[[2,0]] = Rook.new('black',b,[2,0])

#p b.go_away?('white')
b.display_board
p b.check?('white')