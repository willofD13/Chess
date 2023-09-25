require_relative './Pawn.rb'
require_relative './rook.rb'
require_relative './bishop.rb'
require_relative './knight.rb'
require_relative './king.rb'
require_relative './queen.rb'

class Board 
    def initialize 
        @chess_board = Array.new(8) { Array.new(8)}
    end

    def display_board 
        add_pawns
        8.times do |r|
            puts '_ _ _ _ _ _ _ _'
            8.times do |c|
                print "#{@chess_board[r][c]} "
            end
            puts ''
        end
    end

    def add_pawns
        8.times do |c|
            @chess_board[1][c] = Pawn.new('black')
            @chess_board[6][c] = Pawn.new('white')
        end
    end

    def place_piece(location) 
        row,column = location
        @chess_board[row][column]
    end

    def out_of_bounds?(location)
        row,column = location 
        row.between?(0,7) && column.between?(0,7)
    end
end

board = Board.new
board.display_board