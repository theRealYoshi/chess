require 'colorize'
require "byebug"
require_relative 'cursorable'


class Display
  include Cursorable


 def initialize(board)
   @board = board
   @cursor_pos = [0, 0]
 end

 def build_grid
   @board.rows.map.with_index do |row, i|
     build_row(row, i)
   end
 end

 def build_row(row, i)
   row.map.with_index do |piece, j|
     color_options = colors_for(i, j)
     piece.to_s.colorize(color_options)
   end
 end

 def colors_for(i, j)
   if [i, j] == @cursor_pos
     bg = :red
   elsif (i + j).odd?
     bg = :black
   else
     bg = :white
   end
   { background: bg, color: :white }
 end

 def render
   system("clear")
   puts "Chess!! I guess..."
   build_grid.each { |row| puts row.join }
 end

 def show_space(row, col)
   @board.rows[row][col]
 end


end
