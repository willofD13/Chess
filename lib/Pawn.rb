class Pawn < Piece

    def initialize
        @symbol = '♟︎' if Chess.turn.odd?
        @symbol = '♙' if Chess.turn.even?
        @type = 'pawn'
        @current_square = nil
        @moves = [[1,0],[2,0]]
    end
end