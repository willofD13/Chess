class Chess

    def initialize 
        @chess_board = Array.new(8) { Array.new(8,'_')}
        @white_pieces = 16 
        @black_pieces = 16 
        @turn = 1
        @player_1 = nil
        @player_2 = nil 
    end

    def display_board
        puts "| |  |  |  |  | "
        puts  ""
        puts "#{@chess_board[2][0]} | #{@chess_board[2][1]} | #{@chess_board[2][2]} | #{@chess_board[2][3]} | #{@chess_board[2][4]} | #{@chess_board[2][5]} | #{@chess_board[2][6]} | #{@chess_board[2][7]}"
        puts "#{@chess_board[3][0]} | #{@chess_board[3][1]} | #{@chess_board[3][2]} | #{@chess_board[3][3]} | #{@chess_board[3][4]} | #{@chess_board[3][5]} | #{@chess_board[3][6]} | #{@chess_board[3][7]}"
        puts "#{@chess_board[4][0]} | #{@chess_board[4][1]} | #{@chess_board[4][2]} | #{@chess_board[4][3]} | #{@chess_board[4][4]} | #{@chess_board[4][5]} | #{@chess_board[4][6]} | #{@chess_board[4][7]}"
        puts "#{@chess_board[5][0]} | #{@chess_board[5][1]} | #{@chess_board[5][2]} | #{@chess_board[5][3]} | #{@chess_board[5][4]} | #{@chess_board[5][5]} | #{@chess_board[5][6]} | #{@chess_board[5][7]}"
        puts ""
        puts ""
    end
end