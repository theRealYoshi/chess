require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @player = Player.new(@board)
    place_pieces
  end

  def place_pieces
    q = Queen.new
    @board.place_piece([1,1], q)
    q.valid_moves?([1,2], @board)
  end


  def run
    puts "Mark all the spaces on the board!"
    puts "WASD or arrow keys to move the cursor, enter or space to confirm."
    until @board.full?
      pos = @player.move
      @board.mark(pos)
    end
    puts "Hooray, the board is filled!"
  end
end

if __FILE__ == $PROGRAM_NAME
  Game.new.run
end
