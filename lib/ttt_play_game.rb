class TTTGame
  attr_accessor :counter
  def initialize
    @counter = rand(1..2)
    @first_move = ''
    @counter == 1 ? @first_move = 'computer' : @first_move = 'player'
    @computer_pieces= []
    @pieces_played = []
  end

  def run
    game_board({})
    while @pieces_played.length != 9 do
      turn
      place_piece
      @counter += 1
    end
  end

  def display_game
    puts '------------------------'
    puts place_piece[0].join('')
    puts place_piece[1].join('')
    puts place_piece[2].join('')
    puts '------------------------'
  end

  def game_result
    gr = GameResult.new(@computer_pieces, @pieces_played.length)
    gr.run
  end

  def ai
    attr = { state: place_piece, first_move: @first_move, counter: counter }
    ai = AI.new(attr)
    @computer_pieces << ai.run
    pieces_played(ai.run)
  end

  def game_board(attr)
    gb = GameBoard.new(attr)
    gb.run
  end

  def turn
    if counter % 2 == 0
      print 'Players turn. Pick a number: '
      user_input
    else
      puts 'Computers turn'
      ai
    end
    display_game
    game_result unless @computer_pieces.empty?
  end

  def place_piece
    attr = { pieces_played: @pieces_played }
    game_board(attr)
  end

  def place_piece_output
  end

  def pieces_played(place)
    if @pieces_played.include?(place) || ![1,2,3,4,5,6,7,8,9].include?(place)
      puts "Can't play that position. Try again"
      user_input
    elsif !@pieces_played.include?(place)
      @pieces_played << place
    end
  end

  def user_input
    pieces_played(gets.chomp.to_i)
  end
end
