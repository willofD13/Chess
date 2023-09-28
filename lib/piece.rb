class Piece 
    attr_reader :color
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

    def move_piece(board,location,target_loc)
        if valid_moves(location,board).include?(target_loc)
            board[location] = nil
            board[target_loc] = self
        else
            puts "Target location not valid"
        end
    end
end