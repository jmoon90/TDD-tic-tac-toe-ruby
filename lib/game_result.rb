class GameResult
  def winning_hands
  [[1,2,3], [4,5,6], [7,8,9],
   [1,4,7], [2,5,8], [3,6,9],
   [1,5,9], [3,5,7]]
  end

  def output(hands, total_hands)
    if winning_hands.include?(hands)
      'Computer wins'
    elsif total_hands.length == 9
      'Tied game'
    end
  end
end
