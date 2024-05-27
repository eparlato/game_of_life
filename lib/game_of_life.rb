# frozen_string_literal: true

class GameOfLife
  attr_reader :board
  def initialize(board)
    @board = board
  end
  
  def next_gen
    @board.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        cell_neighbours = neighbours_for_cell_at_pos(row_index, column_index)
        
        if cell_neighbours.count(1) == 0
          @board[row_index][column_index] = 0
        end
      end
    end
  end
  
  private
  
  def neighbours_for_cell_at_pos(row_coordinate, column_coordinate)
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
    if @board[row_index].nil? || @board[row_index][column_index].nil?
      return 0
    end
    
    return @board[row_index][column_index]
  end
end