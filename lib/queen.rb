require_relative '../lib/piece'
class Queen < Piece

    def initialize(current_square = nil,color)
        @color = color
        @current_square = current_square
        @moves = [[1,1],[1,-1],[-1,1],[-1,-1],[1,0],[-1,0],[0,-1],[0,1]]
    end

    def to_s 
        @color == 'black' ? '♔' : '♚'
    end
end