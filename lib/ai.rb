#require 'pry'
class AI
  def initialize(state)
    @state = state
    @numbers = []
    @player_pieces = 0
  end

  def run(counter)
    if counter < 2
      initial_move
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
    p = 0
    while p < 1 do
      play_adjacent if @numbers.empty?
      p += 1
    end
    @numbers[0]
  end

  def play_row(i, player)
    row_one   = @state[0]
    row_two   = @state[1]
    row_three = @state[2]
    rows = [row_one, row_two, row_three]
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
    @numbers[0]
  end

  def play_column(i, player)
    col_one =     [@state[0][0],@state[1][0],@state[2][0]]
    col_two =     [@state[0][1],@state[1][1],@state[2][1]]
    col_three =   [@state[0][2],@state[1][2],@state[2][2]]
    columns = [col_one, col_two, col_three]

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
    @numbers[0]
  end

  def play_diagonal(player)
    top_left = [@state[0][0], @state[1][1], @state[2][2]]
    top_right = [@state[0][2], @state[1][1], @state[2][0]]
    diagonals = [top_left, top_right]

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
    @numbers[0]
  end

  def play_adjacent
    col_one =     [@state[0][0],@state[1][0],@state[2][0]]
    col_two =     [@state[0][1],@state[1][1],@state[2][1]]
    col_three =   [@state[0][2],@state[1][2],@state[2][2]]
    columns = [col_one, col_two, col_three]

    top_left = [@state[0][0], @state[1][1], @state[2][2]]
    top_right = [@state[0][2], @state[1][1], @state[2][0]]
    diagonals = [top_left, top_right]

    i = 0
    while i < 3 do
      if @state[i].count { |x| x.is_a? Integer } > 1
        @state[i].each_with_index do |x, index|
          if x == 'x'
            @numbers << @state[i][index+1] if index == 0
            @numbers << @state[i][index+1] if index == 1
            @numbers << @state[i][index-1] if index == 2
          end
        end
      end
      i += 1
    end
    row = 0
    while(row < 3) do
      columns.each do |column|
        if column.count { |x| x.is_a? Integer } > 1
          column.each_with_index do |x, index|
            if x == 'x'
              @numbers << column[index+1] if index == 0
              @numbers << column[index+1] if index == 1
              @numbers << column[index-1] if index == 2
            end
          end
        end
      end
      row += 1
    end

    i = 0
    while(i < 2) do
      if diagonals[i].count { |x| x.is_a? Integer } > 1
        diagonals[i].each_with_index do |x, index|
          if x == 'x'
            @numbers << diagonals[i][index+1] if index == 0
            @numbers << diagonals[i][index+1] if index == 1
            @numbers << diagonals[i][index-1] if index == 2
          end
        end
      end
      i += 1
    end
    @numbers[0]
  end

  def initial_move
    @state[1][1] == 5 ? 5 : 1
  end
end

    state = [[1,    2, 'x'],
             [4,  'o', 'x'],
             ['o', 8,   9]]
    ai = AI.new(state)
  ai.play_column(0, 'x')
