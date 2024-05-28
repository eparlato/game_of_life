# frozen_string_literal: true

class Cell
  attr_reader :status
  attr_accessor :neighbours_status
  
  def initialize(status)
    @status = status
  end
  
  def tick
    if neighbours_status.count(1) == 0
      @status = 0
    end
  end
end