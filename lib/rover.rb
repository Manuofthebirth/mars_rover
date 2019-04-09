require_relative "plateau"

class Rover
  attr_reader :plateau
  attr_accessor :x_coordinate, :y_coordinate, :compass_point

  def initialize (x_coordinate = 0, y_coordinate = 0, compass_point = 'N', plateau)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @compass_point = compass_point
    @plateau = plateau
  end

  def turn_right
    case @compass_point
      when 'N' then @compass_point = 'E'
      when 'S' then @compass_point = 'W'
      when 'E' then @compass_point = 'S'
      when 'W' then @compass_point = 'N'
    end
  end

  def turn_left
    case @compass_point
      when 'N' then @compass_point = 'W'
      when 'S' then @compass_point = 'E'
      when 'E' then @compass_point = 'N'
      when 'W' then @compass_point = 'S'
    end
  end
  
  def move_foward
    case @compass_point
      when 'N' then @y_coordinate += 1 if @y_coordinate < plateau.y_limit
      when 'S' then @y_coordinate -= 1 if @y_coordinate > 0
      when 'E' then @x_coordinate += 1 if @x_coordinate < plateau.x_limit
      when 'W' then @x_coordinate -= 1 if @x_coordinate > 0
    end
  end

end




