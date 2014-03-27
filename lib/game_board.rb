#require 'pry'
class GameBoard
  attr_accessor :state
  attr_reader :players
  def initialize
    @state = []
    @players = ['o', 'x']
    @counter = 0
  end

  def self.run
    gb = GameBoard.new
    gb.new_board
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

  def counter
    if @counter == 0
      if firstPlayer == 'Player'
        @counter = 2
      else
        @counter = 1
      end
    end
    @counter
  end

  def current_board(pieces_played)
    new_board
    r = 0
    while r < 3 do
      i = 0
      while i < 9 do
        a = 0
        while a < pieces_played.length do
          if state[r][i] == pieces_played[a.to_i].to_i
            state[r][i] = players[@counter % 2];
            @counter += 1
          end
          a += 1
        end
        i += 1
      end
     puts state[r].join('')
      r += 1
    end
    state
  end
end
