class Piece 
    attr_reader :color
    def initialize(color,board,location)
        @board = board
        @color = color
        @location = location
    end

    def is_there_an_enemy?(location)
        !@board[location].nil? && @board[location].color != color
    end

    def valid_moves(directions,location)
        moves = []
        directions.each do |d|
            x = d[0] + location[0]
            y = d[1] + location[1]
            moves << [x,y]
        end 
        moves
    end

end