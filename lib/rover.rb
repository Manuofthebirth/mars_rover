require_relative "plateau"

class Rover
  attr_accessor :coordinate_x, :coordinate_y, :orientation_letter

  def initialize (coordinate_x, coordinate_y, orientation_letter)
    @coordinate_x = coordinate_x
    @coordinate_y = coordinate_y
    @orientation_letter = orientation_letter
  end

  def turn_right
  end

  def turn_left
  end

  def move
  end
  
end