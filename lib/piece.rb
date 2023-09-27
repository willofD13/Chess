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

    def valid_moves(array,current_location)
        moves = []
        array.each do |e|
            x = e[0] + current_location[0]
            y = e[1] + current_location[1]
            moves << [x,y]
        end 
        moves
    end

end