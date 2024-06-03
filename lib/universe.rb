# frozen_string_literal: true

require "cell"

class Universe
  attr_reader :structure
  def initialize(cells_status_board)
    @structure = []
    
    board_universe_status_map = {
      0 => Cell::DEAD,
      1 => Cell::ALIVE
    }
    
    cells_status_board.each do |row|
      universe_row = []
      row.each do |cell_value|
        universe_row << Cell.new(board_universe_status_map[cell_value])
      end
      @structure << universe_row
    end
  end
  
  def assign_neighbours_statuses_to_cells
    @structure.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell_neighbours_status = neighbours_statuses_for_cell_at_pos(row_index, column_index)

        cell.neighbours_statuses = cell_neighbours_status
      end
    end
  end
  
  def tick
    @structure.each do |row|
      row.each do |cell|
        cell.tick
      end
    end
  end
  
  def cells_statuses_board
    board = []
    universe_board_status_map = {
      Cell::DEAD => 0,
      Cell::ALIVE => 1
    }
    
    @structure.each do |row_of_cells|
      row = []
      
      row_of_cells.each do |cell|
        row << universe_board_status_map[cell.status]
      end
      
      board << row
    end
    
    board
  end
  
  private

  def neighbours_statuses_for_cell_at_pos(row_coordinate, column_coordinate)
    neighbours_statuses = []

    neighbours_statuses << cell_status_at_position(row_coordinate - 1, column_coordinate - 1)
    neighbours_statuses << cell_status_at_position(row_coordinate - 1, column_coordinate)
    neighbours_statuses << cell_status_at_position(row_coordinate - 1, column_coordinate + 1)
    neighbours_statuses << cell_status_at_position(row_coordinate, column_coordinate - 1)
    neighbours_statuses << cell_status_at_position(row_coordinate, column_coordinate + 1)
    neighbours_statuses << cell_status_at_position(row_coordinate + 1, column_coordinate - 1)
    neighbours_statuses << cell_status_at_position(row_coordinate + 1, column_coordinate)
    neighbours_statuses << cell_status_at_position(row_coordinate + 1, column_coordinate + 1)

    neighbours_statuses
  end

  def cell_status_at_position(row_index, column_index)
    if out_of_bounds?(row_index, column_index)
      return Cell::DEAD
    end

    return @structure[row_index][column_index].status
  end
  
  def out_of_bounds?(row_index, column_index)
    row_index < 0 || row_index >= @structure.size || column_index < 0 || column_index >= @structure[row_index].size
  end
end