require 'byebug'

class Piece
  attr_reader :pos, :occupied, :board, :shape
  def present?
    true
  end
  #
  def moves(board)
  # is this move legal?
  # is the path to that move obstructed?
  check_moves?(board)
  end

  def to_s
    " x "
  end
end

class NullPiece
  attr_reader :pos, :shape

  def initialize
    @shape = "  "
  end

  def present?
    false
  end

  def to_s
    @shape
  end
end



class Queen < Piece

  attr_reader :pos, :board


  def initialize(pos)
    @pos = pos
  end


  DELTAS = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  def valid_moves?(pos, board)
    puts board
    x = pos.first
    y = pos.last
    check_positions = DELTAS.map do |change|
      row = change.first
      col = change.last
      [x + row, y + col]
    end
    check_positions.select { |space| !board.occupied?(space)}

    check_positions
  end

  # def row_check(pos)
  #   x = pos[0]
  #   y = pos[1]
  #   valid_rows = []
  #   x_change_left = 0
  #   while x_change_left > -8
  #     valid_rows << [(x+x_change_left),y] unless (@board[x][y].occupied? || (x+x_change_left) < 0)
  #
  #
  #
  #
  # end

  def present?
    true
  end

  def to_s
    "\u2655".encode("utf-8")
  end

end


module Slideable
  VERTICAL_DIFFS = [[1, 0], [-1, 0]]
  HORIZONTAL_DIFFS = [[0, 1], [0, -1]]
  DIAG_DIFFS = [[-1, 1], [-1, -1], [1, -1], [1, 1]]

  def move_check(pos)
    row = pos.first #pieces position
    col = pos.last
    valid_moves = []

    DIFFS = [1, -1]
    DIFFS.each do |int|
    i = row + int
      until board.occupied?(i,col)
        valid_moves << [i,col]
        i += 1
      end
    end
    HORIZONTAL_DIFFS.each do |horiz|
      new_pos_row = horiz.first + row
      new_pos_col = horiz.last + col
      board.occupied?([new_pos_row, new_pos_col])
    end

  end






end
