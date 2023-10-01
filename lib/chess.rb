require_relative 'pieces.rb'
require_relative 'board.rb'
require 'pry-byebug'
class Chess 
    attr_accessor :board, :turn, :color, :end_game
    def initialize(board = Board.new)
        @board = board
        @board.starting_board
        @color = color
        @turn = 1 
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

    def starting_location
        starting_loc = []
        puts "Select your chess piece. Please separate coordinates with a comma(,)"
        input = gets.chomp
        starting_loc << input.split(',')[0].to_i
        starting_loc << input.split(',')[1].to_i
        starting_loc
    end

    def target_location
        target_loc = []
        puts "Enter target location of your chess piece. Please separate coordinates with a comma(,)"
        input = gets.chomp
        target_loc << input.split(',')[0].to_i
        target_loc << input.split(',')[1].to_i
        target_loc
    end

    def player_turn(color)
        board.display_board
        puts "It's #{color}'s turn"
        starting_loc = starting_location
        target_loc = target_location
        #binding.pry
        board.move_piece(starting_loc,target_loc)
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
            turn.odd? ? color = 'white' : color = 'black'
            player_turn(color)
        end
    end
end
