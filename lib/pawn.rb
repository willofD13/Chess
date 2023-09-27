require_relative 'piece.rb'
require_relative 'stepable.rb'
class Pawn < Piece
    include Stepable
    def move_dirs
        @color == 'black' ? [[1,0],[2,0],[1,-1],[1,1]] : [[-1,0],[-2,0],[-1,1],[-1,-1]]
    end

    def to_s 
        @color == 'black' ? '♙' : '♟︎'
    end

    def valid_moves(location,board)
        moves = []
        
        move_dirs.each do |(dr,dc)|
            current_r, current_c = location

            current_r += dr 
            current_c += dc

        end
        moves
    end  
end

