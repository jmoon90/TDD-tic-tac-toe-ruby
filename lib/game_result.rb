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
    puts "play_again? (Y or Yes)"
    user_input = gets.chomp
    if user_input == 'Y' || user_input == 'Yes'
      game_board = GameBoard.new
      ttt = TTTGame.new
      ttt.run
    else
      puts "Have a wonderful day"
    end
  end
end
