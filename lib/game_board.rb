class GameBoard
  attr_accessor :state

  def initialize(attr)
    @state = []
    @players = ['o', 'x']
    @pieces_played = attr[:pieces_played]
  end

  def run
    new_board
    @pieces_played.nil? ? new_board_print : current_board
  end

  def new_board
    @state = [[1,2,3],
              [4,5,6],
              [7,8,9]]
  end

  def new_board_print
    new_board
    puts @state[0].join('')
    puts @state[1].join('')
    puts @state[2].join('')
    state
  end

  def current_board
    r = 0
    while r < 3 do
      i = 0
      while i < 9 do
        a = 0
        while a < @pieces_played.length do
          if state[r][i] == @pieces_played[a]
            state[r][i] = @players[@pieces_played.index(@pieces_played[a]) % 2]
          end
          a += 1
        end
        i += 1
      end
      r += 1
    end
    state
  end
end
