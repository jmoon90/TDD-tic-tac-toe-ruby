require 'game_board'
require 'ttt_play_game'

describe GameBoard do
  it 'creates a board' do
    game_board = GameBoard.new({})
    expect(game_board.run).to eq([[1,2,3],
                                  [4,5,6],
                                  [7,8,9]])
  end

  it 'displays current board' do
    ttt = TTTGame.new
    ttt.pieces_played(1)
    piece = ttt.place_piece
    expect(piece).to eq([['o', 2, 3],
                         [4, 5, 6],
                         [7, 8, 9]])
  end

  it 'displays new board after pieces are placed' do
    ttt = TTTGame.new
    ttt.pieces_played(1)
    ttt.pieces_played(3)
    piece = ttt.place_piece
    expect(piece).to eq([['o', 2, 'x'],
                         [4, 5, 6],
                         [7, 8, 9]])
  end
end
