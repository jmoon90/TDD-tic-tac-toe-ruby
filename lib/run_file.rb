require_relative 'game_board'
require_relative 'ttt_play_game'

game_board = GameBoard.new
ttt = TTTGame.new
ttt.run
