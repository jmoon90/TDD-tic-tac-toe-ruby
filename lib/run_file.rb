require_relative 'game_board'
require_relative 'ttt_play_game'
require_relative 'ai'

game_board = GameBoard.new
ttt = TTTGame.new
ttt.run
