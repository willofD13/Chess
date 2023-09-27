require_relative '../lib/piece'
class Pawn < Piece

    def move_dirs
        [[1,0],[2,0],[1,-1],[1,1]]
    end

    def to_s 
        @color == 'black' ? '♙' : '♟︎'
    end
end

