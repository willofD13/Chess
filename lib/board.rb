require_relative './piece.rb'
require_relative './pawn.rb'
require_relative './rook.rb'
require_relative './knight.rb'
require_relative './bishop.rb'
require_relative './king.rb'
require_relative './queen.rb'

class Board 
    def initialize 
        @chess_board = Array.new(8) { Array.new(8)}
    end

    def display_board 
        
        8.times do |r|
            puts "_ _ _ _ _ _ _ _"
            8.times do |c|
                print "#{@chess_board[r][c]} "
            end
            puts ''
        end
        
    end

    def []=(location,value)
        coordinate1, coordinate2 = location
        @chess_board[coordinate1][coordinate2] = value
    end

    def [] (location)
        coordinate1, coordinate2 = location
        @chess_board[coordinate1][coordinate2]
    end

    def add_pawns
        8.times do |c|
            @chess_board[1][c] = Pawn.new('black',self,[1,c])
            @chess_board[6][c] = Pawn.new('white',self,[6,c])
        end
    end

    def add_rest_pieces
        @chess_board[0][0] = Rook.new('black',self,[0][0])
        @chess_board[0][7] = Rook.new('black',self,[0][7])
        @chess_board[7][0] = Rook.new('white',self,[7][0])
        @chess_board[7][7] = Rook.new('white',self,[7][7])
        @chess_board[0][1] = Bishop.new('black',self,[0][1])
        @chess_board[0][6] = Bishop.new('black',self,[0][6])
        @chess_board[7][1] = Bishop.new('white',self,[7][1])
        @chess_board[7][6] = Bishop.new('white',self,[7][6])
        @chess_board[0][2] = Knight.new('black',self,[0][2])
        @chess_board[0][5] = Knight.new('black',self,[0][5])
        @chess_board[7][2] = Knight.new('white',self,[7][2])
        @chess_board[7][5] = Knight.new('white',self,[7][5])
        @chess_board[0][3] = King.new('black',self,[0][3])
        @chess_board[0][4] = Queen.new('black',self,[0][4])
        @chess_board[7][3] = King.new('white',self,[7][3])
        @chess_board[7][4] = Queen.new('white',self,[7][4])
    end

    def place_piece(location) 
        row,column = location
        @chess_board[row][column]
    end

    def in_bounds?(location)
        row,column = location 
        row.between?(0,7) && column.between?(0,7)
    end

    def empty?(location)
        row,column = location
        @chess_board[row][column].nil?
    end
end
