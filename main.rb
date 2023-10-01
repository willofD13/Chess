require_relative './lib/pieces.rb'
require_relative './lib/board.rb'
require_relative './lib/chess.rb'


game = Chess.new
game.introduction
game.play_game
