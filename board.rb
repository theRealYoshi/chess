require_relative "piece"

class Board
  GAME_PIECES = { }


  def initialize
    @grid = Array.new(8) { Array.new(8) { NullPiece.new } }
  end

  def full?
    @grid.all? do |row|
      row.all? { |piece| piece.present? }
    end
  end

  def mark(pos)
    x, y = pos
    @grid[x][y] = Piece.new
  end

  def place_piece(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def occupied?(pos)
    x, y = pos
    @grid[x][y].present?
  end

  # def moves(pos)
  #   @grid[pos0][pos1].moves(self)
  # end



  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 8) }
  end

  def rows
    @grid
  end
end
