# frozen_string_literal: true

require "universe"
require "cell"
class GameOfLife
  attr_reader :board
  def initialize(board)
    @board = board
    @universe = Universe.new(board)
  end
  
  def next_gen
    @universe.assign_neighbours_status_to_cells
    
    @universe.tick
    
    @board = @universe.cells_status
  end
end