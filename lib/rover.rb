require_relative "plateau"

class Rover
  attr_reader :plateau
  attr_accessor :current_width, :current_height, :orientation_letter

  def initialize (current_width = 0, current_height = 0, orientation_letter = 'N', plateau)
    @current_width = current_width
    @current_height = current_height
    @orientation_letter = orientation_letter
    @plateau = plateau
  end

  def turn_right
    case @orientation_letter
      when 'N' then @orientation_letter = 'E'
      when 'S' then @orientation_letter = 'W'
      when 'E' then @orientation_letter = 'S'
      when 'W' then @orientation_letter = 'N'
    end
  end

  def turn_left
    case @orientation_letter
      when 'N' then @orientation_letter = 'W'
      when 'S' then @orientation_letter = 'E'
      when 'E' then @orientation_letter = 'N'
      when 'W' then @orientation_letter = 'S'
    end
  end
  
  def move
    case @orientation_letter
      when 'N' then @current_height += 1 if @current_height < plateau.grid_height
      when 'S' then @current_height -= 1 if @current_height > 0
      when 'E' then @current_width += 1 if @current_width < plateau.grid_width
      when 'W' then @current_width -= 1 if @current_width > 0
    end
  end

end




