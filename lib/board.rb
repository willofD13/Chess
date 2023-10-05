require_relative 'pieces.rb'
require 'pry-byebug'
require_relative './pieces/escapable.rb'
class Board 
    include Escapable
    attr_reader :chess_board
    def initialize 
        @chess_board = Array.new(8) { Array.new(8)}
        self.starting_board
    end

    def display_board 
        
        8.times do |r|
            puts "_ _ _ _ _ _ _ _"
            8.times do |c|
                if @chess_board[r][c].nil?
                    print '  '
                else
                    print "#{@chess_board[r][c]} "
                end
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

    def starting_board
        8.times do |c|
            @chess_board[1][c] = Pawn.new('black',self,[1,c])
            @chess_board[6][c] = Pawn.new('white',self,[6,c])
        end

        @chess_board[0][0] = Rook.new('black',self,[0,0])
        @chess_board[0][7] = Rook.new('black',self,[0,7])
        @chess_board[7][0] = Rook.new('white',self,[7,0])
        @chess_board[7][7] = Rook.new('white',self,[7,7])
        @chess_board[0][1] = Bishop.new('black',self,[0,1])
        @chess_board[0][6] = Bishop.new('black',self,[0,6])
        @chess_board[7][1] = Bishop.new('white',self,[7,1])
        @chess_board[7][6] = Bishop.new('white',self,[7,6])
        @chess_board[0][2] = Knight.new('black',self,[0,2])
        @chess_board[0][5] = Knight.new('black',self,[0,5])
        @chess_board[7][2] = Knight.new('white',self,[7,2])
        @chess_board[7][5] = Knight.new('white',self,[7,5])
        @chess_board[0][3] = King.new('black',self,[0,3])
        @chess_board[0][4] = Queen.new('black',self,[0,4])
        @chess_board[7][3] = King.new('white',self,[7,3])
        @chess_board[7][4] = Queen.new('white',self,[7,4])
    end

    def in_bounds?(location)
        row,column = location 
        row.between?(0,7) && column.between?(0,7)
    end

    def empty?(location)
        row,column = location
        @chess_board[row][column].nil?
    end

    def move_piece(starting_loc,target_loc)
        piece = self[starting_loc]

        self[starting_loc] = nil 
        self[target_loc] = piece
        piece.location = target_loc
    
    end

    def pieces 
        @chess_board.flatten.reject { |e| e.nil? }
    end

    def check?(color)
        king_loc = pieces.find { |e| e.color != color && e.class == King}.location
        pieces.select { |p| p.color == color }.each do |piece|
            return true if piece.valid_moves(piece.location,self).include?(king_loc)
        end
        return false
    end 

    def stalemate?(color)
        enemy_pieces = pieces.select { |p| p.color != color }
        enemy_pieces.all? { |piece| piece.valid_moves(piece.location,self).empty? } && !check?(color)
    end

    def king_goes_to_check?(color,starting_loc, target_loc)
        pieces.select { |p| p.color != color }.each do |piece|
            if piece.valid_moves(piece.location,self).include?(target_loc) && self[starting_loc].class == King
                puts "King can not move into a check position."
                return true 
            end
        end
        return false
    end


end

