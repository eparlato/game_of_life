# frozen_string_literal: true
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "game_of_life"

def print_cells_status_board(board)
  board.each do |row|
    puts row.join(" ")
  end
end

initials_cells_status_board = [
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1],
  [0, 1, 0, 1, 0, 1, 0, 1, 0, 1]
]

game_of_life = GameOfLife.new(initials_cells_status_board)

index = 0
puts "\nStart\n"
print_cells_status_board game_of_life.cells_status_board

10.times do
  index += 1
  puts "\nIteration #{index}\n"
  
  game_of_life.next_gen
  
  print_cells_status_board game_of_life.cells_status_board
end