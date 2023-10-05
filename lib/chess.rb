require_relative 'pieces.rb'
require_relative 'board.rb'
require 'pry-byebug'
require 'json'
class Chess 
     
    attr_accessor :board, :turn, :color, :end_game, :current_player, :player_1, :player_2
    def initialize(board = nil,player_1 = nil,player_2 = nil,color = nil,current_player = nil,turn = 1)
        ask_for_load if Dir.exist?('saved_games') && player_1.nil?
        @board = board
        @color = color
        @end_game = false
        @player_1 = player_1
        @player_2 = player_2
        introduction if player_1.nil?
        @turn = turn
        @current_player = current_player
        play_game
    end

    def ask_for_load
        puts 'Do you want to load a game?'
        answer = gets.chomp
        if answer == 'y'
            load_game
        end
    end

    def ask_for_save
        puts 'Do you want to save your game?'
        answer = gets.chomp
        if answer == 'y'
            save_game
        end
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
            if location.length == 2 && !board[location].nil? && board[location].color == color && !board[location].valid_moves(location,board).empty?
                return location
            end 
            
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
            puts "CHECK"
        end
        if board.checkmate?(color)
            end_game = true
            puts "CHECKMATE. The winner is :#{@current_player}."
        end
        if board.stalemate?(color)
            end_game = true
            puts "STALEMATE. Game is over"
        end
        
        ask_for_save
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

    def save_game
        puts "choose your file from 1-5"
        answer = gets.chomp 
        Dir.mkdir('saved_games') unless Dir.exist?('saved_games')
        File.open("./saved_games/#{answer}.jsn", 'w') { |f| f.write(to_json) }
    end

    def to_json
        JSON.dump ({
          :board => @board,
          :player_1 => @player_1,
          :player_2 => @player_2,
          :color => @color,
          :current_player => @current_player,
          :turn => @turn          
        })
    end

    def load_game
        puts "Choose the save file from 1-5"
        answer = gets.chomp 
        Chess.from_json("./saved_games/#{answer}.jsn")
    end

    def self.from_json(file)
        data = JSON.load(File.read(file))
        self.new(data[:board],data[:player_1],data[:player_2],data[:color],data[:current_player],data[:turn])
    end

    def swap_player
        @turn.odd? ? @current_player = @player_1 : @current_player = @player_2
    end

    def swap_color 
        @turn.odd? ? @color = 'white' : @color = 'black'
    end


    def play_game
        board.display_board
        until end_game == true do
            swap_player
            swap_color
            player_turn(color)
            @turn += 1
        end
    end
end
