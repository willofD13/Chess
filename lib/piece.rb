

class Piece 
    def initialize(color,current_square,board)
        @board = board
        @color = color
        @current_square = current_square
    end

    def is_there_an_enemy?(location)
        @board.location.color == @color
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