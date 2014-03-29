#require 'pry'
class AI
  def initialize(state)
    @state = state
    @numbers = []
    @player_pieces = 0

    @row_one   = @state[0]
    @row_two   = @state[1]
    @row_three = @state[2]

    @col_one =   [@state[0][0],@state[1][0],@state[2][0]]
    @col_two =   [@state[0][1],@state[1][1],@state[2][1]]
    @col_three = [@state[0][2],@state[1][2],@state[2][2]]

    @top_left =  [@state[0][0], @state[1][1], @state[2][2]]
    @top_right = [@state[0][2], @state[1][1], @state[2][0]]
  end

  def run(counter)
    if counter < 2
      @state[1][1] == 5 ? 5 : 1
    else
      play_best_move
    end
  end

  def play_best_move
    players = ['x', 'o']

    p = 0
    while p < 2 do
      i = 0
      while i < 3 do
        play_row(i, players[p]) if @numbers.empty?
        play_column(i, players[p]) if @numbers.empty?
        i += 1
      end
      play_diagonal(players[p]) if @numbers.empty?
      p += 1
    end
    play_adjacent if @numbers.empty?
    @numbers[0]
  end

  def play_row(i, player)
    rows = [@row_one, @row_two, @row_three]
    while i < 3 do
      @player_pieces = 0
      if rows[i].count { |x| x.is_a? Integer } == 1
        number = 0
        @state[i].each do |x|
          @player_pieces += 1 if x == player
          number = x if x.is_a? Integer
        end
      end
      i += 1
      @numbers << number if @player_pieces == 2
    end
  end

  def play_column(i, player)
    columns = [@col_one, @col_two, @col_three]

    while i < 3 do
      @player_pieces = 0
      if columns[i].count { |x| x.is_a? Integer } == 1
        number = 0
        columns[i].each do |x|
          @player_pieces += 1 if x == player
          number = x if x.is_a? Integer
        end
      end
      i += 1
      @numbers << number if @player_pieces == 2
    end
  end

  def play_diagonal(player)
    diagonals = [@top_left, @top_right]

    i = 0
    while i < 2 do
      @player_pieces = 0
      if diagonals[i].count { |x| x.is_a? Integer } == 1
        number = 0
        diagonals[i].each do |x|
          @player_pieces += 1 if x == player
          number = x if x.is_a? Integer
        end
      end
      i += 1
      @numbers << number if @player_pieces == 2
    end
  end

  def play_adjacent
    rows = [@row_one, @row_two, @row_three]
    columns = [@col_one, @col_two, @col_three]
    diagonals = [@top_left, @top_right, []]

    playable_position = [rows, columns, diagonals]

    playable_position.each do |direction|
      i = 0
      while i < 3 do
        if direction[i].count { |x| x.is_a? Integer } > 1
          direction[i].each_with_index do |x, index|
            if x == 'x'
              @numbers << direction[i][index+1] if index == 0
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
      if rows[i].count { |x| x.is_a? Integer } > 0
        rows[i].each_with_index do |x, index|
          if x != 'x' && x != 'o'
            @numbers << rows[i][index] if index == 0
            @numbers << rows[i][index] if index == 1
            @numbers << rows[i][index] if index == 2
          end
        end
      end
      i += 1
    end
  end
end
