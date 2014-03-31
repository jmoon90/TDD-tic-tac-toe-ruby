class AI
  def initialize(attr)
    @first_move = attr[:first_move]
    @state = attr[:state]
    @numbers = []
    @player_pieces = 0

    @rows = [@state[0], @state[1], @state[2]]
    @columns = [[@state[0][0],@state[1][0],@state[2][0]],
                [@state[0][1],@state[1][1],@state[2][1]],
                [@state[0][2],@state[1][2],@state[2][2]]]
    @diagonals = [[@state[0][0], @state[1][1], @state[2][2]],
                  [@state[0][2], @state[1][1], @state[2][0]],
                  [[]]]
    @playable_position = [@rows, @columns, @diagonals]
  end

  def run(counter)
    if @first_move == 'player'
      player = 'o'
      computer = 'x'
    else
      computer = 'o'
      player = 'x'
    end

    if counter < 3 || (counter < 4 if @first_move == 'player')
      @state[1][1] == 5 ? 5 : 1
    else
      players = ['o', 'x']
      2.times do |p|
        play_move(players[p])
      end
      play_adjacent(player, computer) if @numbers.empty?
      @numbers[0]
    end
  end

  def play_move(player)
    @playable_position.each do |direction|
      i = 0
      while i < 3 do
        @player_pieces = 0
        if direction[i].count { |x| x.is_a? Integer } == 1
          number = 0
          direction[i].each do |x|
            @player_pieces += 1 if x == player
            number = x if x.is_a? Integer
          end
        end
        i += 1
        @numbers << number if @player_pieces == 2 && @numbers.empty?
      end
    end
  end

  def play_adjacent(player, computer)
    #edge case
    if @rows[0][0] == 1 && @rows[0][1] == player &&
       @rows[1][0] == player && @rows[1][1] == computer
      @numbers << 1
    end

    @playable_position.each do |direction|
      i = 0
      while i < 3 do
        if direction[i].count { |x| x.is_a? Integer } > 1
          direction[i].each_with_index do |x, index|
            if x == computer
              @numbers << direction[i][index-1] if index == 0
              @numbers << direction[i][index+1] if index == 1
              @numbers << direction[i][index-1] if index == 2
            end
          end
        end
        i += 1
      end
    end

    i = 0
    while(i < 3) do
      if @rows[i].count { |x| x.is_a? Integer } > 0
        @rows[i].each_with_index do |x, index|
          if x != 'x' && x != 'o'
            @numbers << @rows[i][index] if index == 0
            @numbers << @rows[i][index] if index == 1
            @numbers << @rows[i][index] if index == 2
          end
        end
      end
      i += 1
    end
  end
end
