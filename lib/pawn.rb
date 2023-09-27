require_relative 'piece.rb'
require_relative 'stepable.rb'
class Pawn < Piece
    include Stepable
    def move_dirs
        [[1,0],[2,0],[1,-1],[1,1]]
    end

    def to_s 
        @color == 'black' ? '♙' : '♟︎'
    end
end

