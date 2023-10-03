require_relative 'pieces.rb'
require_relative 'board.rb'
require 'pry-byebug'
class Chess 
    @@turn = 1 
    attr_accessor :board, :turn, :color, :end_game
    def initialize(board)
        @board = board
        board.starting_board
        board.display_board
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
        puts 'You are ready to play!.Be sure to pick the right chess piece color.'
        puts 'First coordinate represents the board row while the second represents column.Both of them must be between 0 and 7.Have fun!'
    end

    def starting_location(color)
        puts "Choose your chess piece."
        loop do
            location = gets.chomp.split(',').map { |e| e.to_i}
            return location if location.length == 2 && !board[location].nil? && board[location].color == color
            
            puts "Wrong input!. Be sure you picked a #{color} chess piece and the coordinates input have the right value and format."
        end
    end

    def target_location(color)
        puts "Make your move."
        gets.chomp.split(',').map { |e| e.to_i}
    end

    def player_turn(color)
        puts "It's #{color}'s turn"
        starting_loc = starting_location(color)
        verify_and_move(starting_loc,color)
        board.display_board
        
        if board.check?(color)
            puts "Check"
        end
        if board.checkmate?(color)
            end_game = true
            puts "Checkmate. Game is over"
        end
        if board.stalemate?(color)
            end_game = true
            puts "Stalemate. Game is over"
        end
    end

    def verify_and_move(starting_loc,color)
        loop do
            target_loc = target_location(color)
        
            if  !board.king_goes_to_check?(color,starting_loc,target_loc) && target_loc.length == 2 && 
                board[starting_loc].valid_moves(starting_loc,board).include?(target_loc)

                board.move_piece(starting_loc,target_loc) 
                break
            end
            puts "Invalid move!. Check your coordinates values and format."
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
