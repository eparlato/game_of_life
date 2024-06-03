# frozen_string_literal: true

class Cell
  attr_reader :status
  attr_accessor :neighbours_statuses
  
  ALIVE = :alive
  DEAD = :dead
  
  def initialize(status)
    @status = status
  end
  
  def tick
    if @status == ALIVE
      if neighbours_statuses.count(ALIVE) <= 1
        @status = DEAD
      elsif neighbours_statuses.count(ALIVE) == 2 || neighbours_statuses.count(ALIVE) == 3
        @status = ALIVE      
      elsif neighbours_statuses.count(ALIVE) >= 4
        @status = DEAD
      end
    end
    
    if @status == DEAD && neighbours_statuses.count(ALIVE) == 3
      @status = ALIVE
    end
  end
end