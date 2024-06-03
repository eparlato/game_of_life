# frozen_string_literal: true

require "universe"
require "cell"
class GameOfLife
  def initialize(initial_cells_status_board)
    @universe = Universe.new(initial_cells_status_board)
  end
  
  def next_gen
    @universe.assign_neighbours_statuses_to_cells
    
    @universe.tick
  end
  
  def cells_statuses_board
    @universe.cells_statuses_board
  end
end