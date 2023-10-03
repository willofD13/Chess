class Piece 
    attr_accessor :color, :location
    def initialize(color,board,location)
        @board = board
        @color = color
        @location = location
    end

    def is_there_an_enemy?(location)
        !@board[location].nil?  && @board[location].color != color
    end

    def is_it_a_friend?(location)
        !@board[location].nil?  && @board[location].color == color
    end
end