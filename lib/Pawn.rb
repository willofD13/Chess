class Pawn

    def initialize
        @symbol = '♟︎' if Chess.turn.odd?
        @symbol = '' if Chess.turn.even?
        @type = 'pawn'
        @current_square = nil
    end
end