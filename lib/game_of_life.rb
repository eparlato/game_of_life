# frozen_string_literal: true

require "universe"
require "cell"
class GameOfLife
  def initialize(board)
    @board = board
    @universe = Universe.new(board)
  end
  
  def next_gen
    @universe.assign_neighbours_status_to_cells
    
    @universe.tick
  end
  
  def board
    @universe.cells_status
  end
end