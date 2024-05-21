# Conway's Game of Life

From [Codurance Katas](https://www.codurance.com/katas/conways-game-of-life)

Implement a finite version of Conway's Game of Life.

Here are the rules (courtesy of Wikipedia):

The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states: alive or dead. Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent to it. At each step in time, the following transitions occur:

* Any live cell with fewer than two live neighbours dies, as if caused by under-population.
* Any live cell with two or three live neighbours lives on to the next generation.
* Any live cell with more than three live neighbours dies, as if by overcrowding.
* Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

* The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one)

Your game should be constructed with initial state of a two-dimensional array of boolean values, and a single public method to move to the next generation:

```ruby
class GameOfLife
  def initialize(board) 
    # Your code here
  end
  
  def next_gen() 
    # Your code here
  end
end
```

Notes

* The dimensions of the array stay constant throughout the game - the 'universe' never grows.
* Cells outside the bounds of the array should be considered permanently dead (they never come to life).