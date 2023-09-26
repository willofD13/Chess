

class Piece 
    def initialize(color,current_square)
        @color = color
        @current_square = current_square
    end

    def possible_moves(moves)
        valid_moves(moves)
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