# frozen_string_literal: true

require "cell"

class Universe
  def initialize(seed)
    @structure = []

    seed.each do |row|
      universe_row = []
      row.each do |cell_value|
        universe_row << Cell.new(cell_value)
      end
      @structure << universe_row
    end
  end
  
  def assign_neighbours_status_to_cells
    @structure.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell_neighbours_status = neighbours_status_for_cell_at_pos(row_index, column_index)

        cell.neighbours_status = cell_neighbours_status
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
  
  def cells_status
    board = []
    
    @structure.each do |row_of_cells|
      row = []
      
      row_of_cells.each do |cell|
        row << cell.status
      end
      
      board << row
    end
    
    board
  end
  
  private

  def neighbours_status_for_cell_at_pos(row_coordinate, column_coordinate)
    neighbours = []

    neighbours << cell_value_at_position(row_coordinate - 1, column_coordinate - 1)
    neighbours << cell_value_at_position(row_coordinate - 1, column_coordinate)
    neighbours << cell_value_at_position(row_coordinate - 1, column_coordinate + 1)
    neighbours << cell_value_at_position(row_coordinate, column_coordinate - 1)
    neighbours << cell_value_at_position(row_coordinate, column_coordinate + 1)
    neighbours << cell_value_at_position(row_coordinate + 1, column_coordinate - 1)
    neighbours << cell_value_at_position(row_coordinate + 1, column_coordinate)
    neighbours << cell_value_at_position(row_coordinate + 1, column_coordinate + 1)

    neighbours
  end

  def cell_value_at_position(row_index, column_index)
    if @structure[row_index].nil? || @structure[row_index][column_index].nil?
      return 0
    end

    return @structure[row_index][column_index].status
  end
end