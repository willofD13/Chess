require 'pry-byebug'
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

    def place_pieces
        @chess_board[1].map! { |i| i = '♙'} 
        @chess_board[6].map! { |i| i = '♟︎'}
        @chess_board[0][0] = '♖'
        @chess_board[0][7] = '♖'
        @chess_board[7][0] = '♜'
        @chess_board[7][7] = '♜'
        @chess_board[0][1] = '♘'
        @chess_board[0][6] = '♘'
        @chess_board[7][1] = '♞'
        @chess_board[7][6] = '♞'
        @chess_board[0][2] = '♗'
        @chess_board[0][5] = '♗'
        @chess_board[7][2] = '♝'
        @chess_board[7][5] = '♝'
        @chess_board[0][3] = '♕'
        @chess_board[0][4] = '♔'
        @chess_board[7][3] = '♛'
        @chess_board[7][4] = '♚'
        #binding.pry
    end

end

game = Chess.new
game.place_pieces