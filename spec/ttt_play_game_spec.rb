require 'ttt_play_game'
require 'game_board'


describe TTTGame do
  it 'is computers turn if counter is odd' do
    def turn
      @counter = 1
      if @counter % 2 == 0
        puts 'Players turn'
        user_input
      else
        'Computers turn'
      end
    end
    expect(turn).to eql('Computers turn')
  end

  it 'players user input' do
    play_game = TTTGame.new
    user_input = 1
    place_piece = play_game.pieces_played(user_input)
    expect(place_piece).to eql([1])
  end

  it 'player piece only if it was not played before' do
    play_game = TTTGame.new
    user_input = 1
    play_game.pieces_played(user_input)
    user_input = 1
    place_piece = play_game.pieces_played(user_input)
    expect(place_piece).to eql("Can't play that position. Try again")
  end
end
