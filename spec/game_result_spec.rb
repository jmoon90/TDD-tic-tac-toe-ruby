require 'game_result'
describe GameResult do

  before(:each) do
    def winning_hands
      [[1,2,3], [4,5,6], [7,8,9],
       [1,4,7], [2,5,8], [3,6,9],
       [1,5,9], [3,5,7]]
    end

    def output(winning_hands, computer_hands, total_hands)
      winning_hands.each do |hand|
        if (hand - computer_hands).empty?
          return 'Computer wins'
        elsif total_hands == 9 && hand == [3,5,7]
          return 'Tied game'
        end
      end
    end
  end

  it 'determines if computer won' do
    @computer_hand = [1,2,3]
    @total_hands = [1,2,3,8,9]
    expect(output(winning_hands, @computer_hand, @total_hands)).to eql('Computer wins')
  end

  it 'determines if game was tied' do
    @computer_hand = [1,3,4,9]
    @total_hands = [1,2,3,4,5,6,7,8,9].length
    expect(output(winning_hands, @computer_hand, @total_hands)).to eql('Tied game')
  end

  it "doesn't do anything if game isn't over" do
    computer_hand = [1,3]
    total_hands = [1,3,8]
    gr = GameResult.new(computer_hand, total_hands)

    expect(gr.output).to eql(winning_hands)

  end
end
