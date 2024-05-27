# frozen_string_literal: true

class GameOfLife
  attr_reader :board
  def initialize(board)
    @board = board
  end
  
  def next_gen
    cell_neighbours = neighbours_for_cell_at_pos(1, 1)
    
    if cell_neighbours.count(1) == 0
      @board[1][1] = 0
    end
  end
  
  private
  
  def neighbours_for_cell_at_pos(row_coordinate, column_coordinate)
    neighbours = []

    neighbours << @board[row_coordinate - 1][column_coordinate - 1] # top-left
    neighbours << @board[row_coordinate - 1][column_coordinate] # top-center
    neighbours << @board[row_coordinate - 1][column_coordinate + 1] # top-right
    neighbours << @board[row_coordinate][column_coordinate - 1] # center-left
    neighbours << @board[row_coordinate][column_coordinate + 1] # center-right
    neighbours << @board[row_coordinate + 1][column_coordinate - 1] # bottom-left
    neighbours << @board[row_coordinate + 1][column_coordinate] # bottom-center
    neighbours << @board[row_coordinate + 1][column_coordinate + 1] # bottom-right
    
    neighbours
  end
end