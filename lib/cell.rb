# frozen_string_literal: true

class Cell
  attr_reader :status
  attr_accessor :neighbours_status
  
  def initialize(status)
    @status = status
  end
  
  def tick
    if @status == 1
      if neighbours_status.count(1) <= 1
        @status = 0
      elsif neighbours_status.count(1) == 2 || neighbours_status.count(1) == 3
        @status = 1       
      elsif neighbours_status.count(1) >= 4
        @status = 0
      end
    end
    
    if @status == 0 && neighbours_status.count(1) == 3
      @status = 1
    end
  end
end