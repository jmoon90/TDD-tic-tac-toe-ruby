class GameResult
  def initialize(computer_hands, total_hands)
    @computer_hands = computer_hands
    @total_hands = total_hands
  end

  def run
    output
  end

  def winning_hands
    [[1,2,3], [4,5,6], [7,8,9],
     [1,4,7], [2,5,8], [3,6,9],
     [1,5,9], [3,5,7]]
  end

  def output
    winning_hands.each do |hand|
      if (hand - @computer_hands).empty?
        puts 'Computer wins'
        message
        abort
      elsif @total_hands == 9 && hand == [3,5,7]
        puts 'Tied game'
        message
        abort
      end
    end
  end

  def message
    print "play_again? (y or yes): "
    user_input = gets.chomp
    if user_input == 'y' || user_input == 'yes'
      puts "\nTIC---------------------"
      puts '----------TAC-----------'
      puts '---------------------TOE'
      game_board
      play_new_game
    else
      puts "Have a wonderful day"
    end
  end

  def game_board
    GameBoard.new({})
  end

  def play_new_game
    ttt = TTTGame.new
    ttt.run
  end
end
