class TTTGame
  attr_accessor :counter
  def initialize
    @counter = rand(1..2)
    @first_move = 'who'
    @counter == 1 ? @first_move = 'computer' : @first_move = 'player'
    @computer_pieces= []
    @pieces_played = []
  end

  def check_game_result
    gr = GameResult.new(@computer_pieces, @pieces_played.length)
    gr.run
  end

  def turn
    if counter % 2 == 0
      puts 'Players turn. Place your piece (pick a number)'
      user_input
    else
      puts 'Computers turn'
      attr = { state: place_piece, first_move: @first_move }
      ai = AI.new(attr)
      pieces_played(ai.run(counter))
      @computer_pieces << ai.run(counter)
    end
    puts place_piece[0].join('')
    puts place_piece[1].join('')
    puts place_piece[2].join('')
    check_game_result unless @computer_pieces.empty?
  end

  def pieces_played(place)
    if @pieces_played.include?(place) || ![1,2,3,4,5,6,7,8,9].include?(place)
      puts "Can't play that position. Try again"
      user_input
    elsif !@pieces_played.include?(place)
      @pieces_played << place
    end
  end

  def place_piece
    gb = GameBoard.new
    gb.current_board(@pieces_played)
  end

  def user_input
    pieces_played(gets.chomp.to_i)
  end

  def run
    GameBoard.run
    while @pieces_played.length != 9 do
      turn
      place_piece
      @counter += 1
    end
  end
end
