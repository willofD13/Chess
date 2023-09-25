class Piece 
    def initialize(type,symbol,current_square)
        @type = type
        @symbol = symbol
        @current_square = current_square
    end

    def possible_moves(moves)
        legal_moves = valid_moves(moves)
    end

    def valid_moves(moves)
        array = []
        moves.each do |move|
            x = move[0] + @current_square[0]
            y = move[1] + @current_square[1]
            array << [x,y]
        end
        return array
    end

end
