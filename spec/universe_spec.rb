# frozen_string_literal: true

require "universe"

RSpec.describe Universe do
  
  describe "#assign_neighbours_status_to_cells" do
    context "when a cell is in a corner" do
      it "considers cells outside the boundaries as dead cells" do
        # The lower-right cell has value 1 on purpose, to prevent implement a wrong mechanism to read 
        # out-of-boundaries cells. 
        # In fact, initial_cells_status_board[-1][-1] doesn't return nil, but returns -1,
        # because negative indexes in Ruby are used to counting from the end.
        # So initial_cells_status_board[-1] returns the last row of the matrix,
        # and initial_cells_status_board[-1][-1] returns the last element of the last row of the matrix,
        # that is the lower right 1
        initial_cells_status_board = [
          [1, 0, 0, 0, 0],  
          [0, 1, 0, 0, 0], 
          [0, 0, 0, 0, 0],  
          [0, 0, 0, 0, 0],  
          [0, 0, 0, 0, 1]  
        ]
        
        universe = Universe.new(initial_cells_status_board)
        
        universe.assign_neighbours_status_to_cells
        
        upper_left_cell = universe.structure[0][0]

        expected_neighbours = [:dead, :dead, :dead, :dead, :dead, :dead, :dead, :alive]        
        expect(upper_left_cell.neighbours_status).to eq(expected_neighbours)
      end
    end  
  end
end