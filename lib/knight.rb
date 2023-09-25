require_relative '../lib/piece'
class Knight < Piece

    def initialize(current_square,color)
        @color = color
        @current_square = current_square
        @moves = [[+2,+1], [+2,-1], [+1,+2], [+1,-2], [-1,+2], [-1,-2], [-2,+1], [-2,-1]]
    end

    def to_s 
        @color == 'black' ? '♘' : '♞'
    end
end