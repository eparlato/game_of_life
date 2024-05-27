# frozen_string_literal: true

require "game_of_life"

RSpec.describe "GameOfLife" do
  context "on a 3x3 board" do
    context "a living cell in the center of the board" do
      context "with zero living cells around" do
        let(:board) { [ 
          [0, 0, 0],
          [0, 1, 0],
          [0, 0, 0]
        ]}
        
        it "dies at next gen" do
          game_of_life = GameOfLife.new(board)
          
          game_of_life.next_gen
          
          expected_board = [
            [0, 0, 0],
            [0, 0, 0],
            [0, 0, 0]
          ] 
          
          expect(game_of_life.board).to eq(expected_board)
        end
      end
    end
  end
end