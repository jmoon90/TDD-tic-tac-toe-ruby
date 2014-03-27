class TTTGame
  def initialize
    @counter = 0
    @pieces_played = []
  end

  def turn
    if @counter % 2 == 0
      puts 'Players turn. Place your piece'
      user_input
    else
      puts 'Computers turn'
      user_input
    end
  end

  def pieces_played(place)
    if @pieces_played.include?(place)
      "Can't play that position. Try again"
    elsif !@pieces_played.include?(place)
      @counter += 1
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
    puts GameBoard.run
    ttt = TTTGame.new
    while @pieces_played.length < 9 do
      turn
      place_piece
    end
  end
end
