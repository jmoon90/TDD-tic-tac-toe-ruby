class GameBoard
  attr_accessor :state
  def initialize
    @state = []
    @players = ['o', 'x']
  end

  def self.run
    gb = GameBoard.new
    gb.new_board
    puts gb.new_board[0].join('')
    puts gb.new_board[1].join('')
    puts gb.new_board[2].join('')
  end

  def new_board
    board = [[1,2,3],
             [4,5,6],
             [7,8,9]]
    board.each do |row|
      state << row
    end
    state
  end

  def current_board(pieces_played)
    new_board
    r = 0
    while r < 3 do
      i = 0
      while i < 9 do
        a = 0
        while a < pieces_played.length do
          if state[r][i] == pieces_played[a]
            state[r][i] = @players[pieces_played.index(pieces_played[a]) % 2]
          end
          a += 1
        end
        i += 1
      end
      r += 1
    end
    return state
  end
end
