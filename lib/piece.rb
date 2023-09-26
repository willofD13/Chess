

class Piece 
    attr_reader :color
    def initialize(color,board)
        @board = board
        @color = color
    end

    def is_there_an_enemy?(location)
        @board[location].color != color
    end

    def valid_directions(directions)
        array = []
        moves.each do |move|
            x = move[0] + @current_square[0]
            y = move[1] + @current_square[1]
            array << [x,y]
        end
        return array
    end

end