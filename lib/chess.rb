require 'pry-byebug'
class Chess

    def initialize 
        @board = Board.new
        @board.place_pieces
        @board.display_board
        @turn = 1
        @player_1 = nil
        @player_2 = nil 
    end

    

    

    def introduction
        puts "The game is about to start!"
        puts "Player 1 enter your name"
        @player_1  = gets.chomp 
        puts "Player 2 enter your name"
        @player_2 = gets.chomp 
        puts "All right. Let's begin!"
    end

    def chess_piece_choice
        puts "Make your piece choice"
        loop do
            @chess_piece = gets.chomp.downcase
            verified_chess_piece = verify_chess_piece(@chess_piece)
            return verified_chess_piece if verified_chess_piece
            
            puts "Input error"
        end
    end 

    def verify_chess_piece(string)
        return string if string == 'pawn' || string == 'rook' || string == 'knight' || string == 'bishop' || string == 'king' || string == 'queen'
    end
        
    def target_square_choice
        puts "Enter the target square. Please separate numbers with a comma."
        loop do
            target_square = gets.chomp
            verified_target_square = verify_target_square(target_square)
            return verified_target_square if verified_target_square

            puts "Input error"
        end
    end

    def verified_target_square(string)
        array = string.split(',')
        return array if array[0].between?(0,7) && array[1].between?(0,7) && @chess_board[array[0]][array[1]] == 
    end


        

end

