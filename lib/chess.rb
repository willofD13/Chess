require_relative 'pieces.rb'
require_relative 'board.rb'
require 'pry-byebug'
class Chess 
    @@turn = 1 
    attr_accessor :board, :turn, :color, :end_game
    def initialize(board = Board.new)
        @board = board
        @board.starting_board
        @color = color
        @end_game = false
        @player_1 = nil 
        @player_2 = nil
    end

    def introduction
        puts 'Welcome to the game.'
        puts 'Player1 enter your name'
        @player_1 = gets.chomp
        puts 'Great. You move the white pawns'
        puts 'Player2 enter your name'
        @player_2 = gets.chomp 
        puts 'Thank you. You move the black pawns'
        puts 'You are ready to play!'
    end

    def starting_location(color)
        puts "Select your chess piece. Please separate coordinates with a comma(,)"
        loop do
            location = gets.chomp.split(',').map { |e| e.to_i}
            return location if board[location].color == color
            
            puts "Wrong chess piece choice!. Please select a piece of #{color} color."
        end
    end

    def target_location(color)
        puts "Enter target location of your chess piece. Please separate coordinates with a comma(,)"
        gets.chomp.split(',').map { |e| e.to_i}
    end

    def player_turn(color)
        board.display_board
        puts "It's #{color}'s turn"
        #binding.pry
        board.move_piece(starting_location(color),target_location(color))
        if board.check?(color)
            puts "Check"
            end
        if board.checkmate?(color)
            end_game = true
            puts "Checkmate. Game is over"
        end
    end

    def play_game
        until end_game == true do
            @@turn.odd? ? color = 'white' : color = 'black'
            player_turn(color)
            @@turn += 1 
        end
    end
end
