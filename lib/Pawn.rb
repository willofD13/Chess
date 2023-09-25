class Pawn < Piece

    def initialize(current_square,color)
        @color = color
        @current_square = current_square
        @moves = [[1,0],[2,0],[1,-1],[1,1]]
    end

    def to_s 
        @color == 'black' ? '♙' : '♟︎'
    end
end