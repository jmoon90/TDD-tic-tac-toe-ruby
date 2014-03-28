require 'ai'
describe AI do
  it 'places piece optimal place' do
    state = [[1, 2, 3],
             [4, 5, 6],
             [7,'o', 9]]
    ai = AI.new(state)
    expect(ai.initial_move).to eql(5)
  end

  it 'places piece optimal place' do
    state = [[1, 2, 3],
             [4, 'o', 6],
             [7, 8, 9]]
    ai = AI.new(state)
    expect(ai.initial_move).to eql(1)
  end

  it 'place piece row to win' do
    state = [['x','x', 3],
             ['o', 5, 6],
             [7,'o', 9]]
    ai = AI.new(state)
    expect(ai.play_row(0, 'x')).to eql(3)
  end

  it 'place piece row to win' do
    state = [['x', 2, 'x'],
             ['o', 5, 6],
             [7,'o', 9]]
    ai = AI.new(state)
    expect(ai.play_row(0, 'x')).to eql(2)
  end

  it 'place piece row to win' do
    state = [[1, 'x', 'x'],
             ['o', 5, 6],
             [7,'o', 9]]
    ai = AI.new(state)
    expect(ai.play_row(0, 'x')).to eql(1)
  end

  it 'place piece column to win' do
    computer_hand = [1, 4]
    state = [['x', 2, 3],
             ['x', 5, 'o'],
             [7, 'o', 9]]
    ai = AI.new(state)
    expect(ai.play_column(0, 'x')).to eql(7)
  end

  it 'place piece column to win' do
    state = [[1, 2, 3],
             [4, 'x', 'o'],
             ['o','x', 9]]
    ai = AI.new(state)
    expect(ai.play_column(1, 'x')).to eql(2)
  end

  it 'place piece column to block' do
    state = [['o', 2, 3],
             [4, 'x', 6],
             ['o',8, 9]]
    ai = AI.new(state)
    expect(ai.play_column(0, 'o')).to eql(4)
  end

  it 'place piece column to win' do
    state = [[1,    2, 'x'],
             [4,  'o', 'x'],
             ['o', 8,   9]]
    ai = AI.new(state)
    expect(ai.play_column(0, 'x')).to eql(9)
  end

  it 'place piece diagonal to win' do
    state = [[1,    2,   3],
             ['o', 'x', 'o'],
             ['x', 8,    9]]
    ai = AI.new(state)
    expect(ai.play_diagonal('x')).to eql(3)
  end

  it 'place piece diagonal to win' do
    state = [[1,    2,   'x'],
             ['o', 5, 'o'],
             ['x', 8,    9]]
    ai = AI.new(state)
    expect(ai.play_diagonal('x')).to eql(5)
  end

  it 'place piece diagonal to win' do
    state = [[1,    2,   3],
             ['o', 'x', 'o'],
             [7, 8,    'x']]
    ai = AI.new(state)
    expect(ai.play_diagonal('x')).to eql(1)
  end

  it 'place piece diagonal to win' do
    state = [['x',    2,   3],
             ['o', 'x', 'o'],
             [7, 8,    9]]
    ai = AI.new(state)
    expect(ai.play_diagonal('x')).to eql(9)
  end

  it 'plays adjacent row if there are no 2 pieces adjacent' do
    state = [[1,'o',3],
            [4,'x',6],
            [7,'x','o']]
    ai = AI.new(state)
    expect(ai.play_adjacent).to eql(6)
  end

  it 'plays adjacent row if there are no 2 pieces adjacent' do
    state = [[1,2,3],
            [4,'x',6],
            [7, 8,'o']]
    ai = AI.new(state)
    expect(ai.play_adjacent).to eql(6)
  end

  it 'plays adjacent column if there are no 2 pieces adjacent' do
    state = [[1,2, 3],
            [4,'x','o'],
            ['o', 8,9]]
    ai = AI.new(state)
    expect(ai.play_adjacent).to eql(8)
  end

  it 'plays adjacent column if there are no 2 pieces adjacent' do
    state =[[1,  'o',  3],
            [4,  'x', 'o'],
            ['o','x', 9]]
    ai = AI.new(state)
    expect(ai.play_adjacent).to eql(9)
  end

#check methods from run method
  it 'place piece to block column' do
    state = [['o',2,  3],
             ['o','x',6],
             [7,  8,  9]]
    ai = AI.new(state)
    expect(ai.run(6)).to eql(7)
  end

  it 'place piece to block row' do
    state = [['o', 2, 'o'],
             [4,'x',6],
             [7,  8,  9]]
    ai = AI.new(state)
    expect(ai.run(6)).to eql(2)
  end
end