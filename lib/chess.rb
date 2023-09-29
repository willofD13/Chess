require_relative 'pieces.rb'
require_relative 'board.rb'

class Chess 
    def initialize(board = Board.new, piece)
        @board = board 
        @piece = piece
        @turn = 1 
    end

    def introduction
        puts 'Welcome to the game.'
        puts 'Player1 enter your name'
        @player_1 = gets.chomp 
        puts 'Great. You move the white pawns'
        puts 'Player2 enter your name'
        puts 'Thank you. You move the black pawns'
        @player_2 = gets.chomp 
        puts 'You are ready to play!'
    end
end
