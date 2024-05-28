# frozen_string_literal: true

require "cell"
class GameOfLife
  attr_reader :board
  def initialize(board)
    @board = board
    @universe = initialize_with_seed(board)
  end
  
  def next_gen
    @universe.each_with_index do |row, row_index|
      row.each_index do |column_index|
        cell_neighbours_status = neighbours_status_for_cell_at_pos(row_index, column_index)
        
        @universe[row_index][column_index].neighbours_status = cell_neighbours_status 
      end
    end
    
    @universe.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell.tick
        @board[row_index][column_index] = cell.status
      end
    end
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
    if @universe[row_index].nil? || @universe[row_index][column_index].nil?
      return 0
    end
    
    return @universe[row_index][column_index].status
  end
  
  def initialize_with_seed(board)
    universe = []
    
    board.each do |row|
      universe_row = []
      row.each do |cell_value|
        universe_row << Cell.new(cell_value)
      end
      universe << universe_row
    end
    
    universe
  end
end