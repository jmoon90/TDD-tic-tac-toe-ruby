require 'game_result'
describe GameResult do
  it 'determines if computer won' do
    pending "pending"
    gr = GameResult.new
    computer_hand = [1,2,3]
    total_hands = [1,2,3,8,9]
    expect(gr.output(computer_hand, total_hands)).to eql('Computer wins')
  end

  it 'determines if game was tied' do
    pending "pending"
    gr = GameResult.new
    computer_hand = [1,3,4,9]
    total_hands = [1,2,3,4,5,6,7,8,9]
    expect(gr.output(computer_hand, total_hands)).to eql('Tied game')
  end

  it "doesn't do anything if game isn't over" do
    pending "pending"
    gr = GameResult.new
    player_hand = [8]
    computer_hand = [1,3]
    total_hands = [1,3,8]

    expect(gr.output(computer_hand, total_hands)).to eql(nil)
  end
end
