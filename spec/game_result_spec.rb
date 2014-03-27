require 'game_result'
describe GameResult do
  it 'determines if computer won' do
    gr = GameResult.new
    computer_hand = [1,2,3]
    total_hands = [1,2,3,8,9]
    expect(gr.output(computer_hand, total_hands)).to eql('Computer wins')
  end

  it 'determines if game was tied' do
    gr = GameResult.new
    computer_hand = [1,3,4,9]
    total_hands = [1,2,3,4,5,6,7,8,9]
    expect(gr.output(computer_hand, total_hands)).to eql('Tied game')
  end
end
