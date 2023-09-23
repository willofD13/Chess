class Chess

    def initialize 
        @chess_board = Array.new(8) { Array.new(8,'_')}
        @white_pieces = 16 
        @black_pieces = 16 
        @turn = 1
        @player_1 = nil
        @player_2 = nil 
    end
    
end