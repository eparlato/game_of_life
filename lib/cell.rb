# frozen_string_literal: true

class Cell
  attr_reader :status
  attr_accessor :neighbours_status
  
  def initialize(status)
    @status = status
  end
  
  def tick
    if @status == :alive
      if neighbours_status.count(:alive) <= 1
        @status = :dead
      elsif neighbours_status.count(:alive) == 2 || neighbours_status.count(:alive) == 3
        @status = :alive      
      elsif neighbours_status.count(:alive) >= 4
        @status = :dead
      end
    end
    
    if @status == :dead && neighbours_status.count(:alive) == 3
      @status = :alive
    end
  end
end