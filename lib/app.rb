require_relative "plateau"
require_relative "rover"

class App
  attr_accessor :rover, :plateau, :position_inputs

  def initialize(rover, plateau)
    @rover = rover
    @plateau = plateau
    @position_inputs = []
  end

  def run
    set_grid
    loop do
      set_x_position
      set_y_position
      set_orientation
      print_commands
      movement_inputs = gets.chomp
      set_movement(movement_inputs)
      status_report 
      answer = gets.chomp.downcase
      if answer == 'stop'
        break
      end
      send_another(answer)
    end
  end

  private

  def set_grid
    puts "\nLet's define the Plateau size first. What's the grid width limit (x coordinate)?"
    x_limit = gets.chomp.to_i
    x_limit <= 0 ? plateau.grid_width = 5 : plateau.grid_width = x_limit

    puts "And what's the grid height limit (y coordinate)?"
    y_limit = gets.chomp.to_i
    y_limit <= 0 ? plateau.grid_height = 5 : plateau.grid_height = y_limit

    puts "\n*************************************************************"
    puts "Ok! The Plateau grid limits are: #{plateau.grid_width} (x: width) #{plateau.grid_height} (y: height) !"
    puts "*************************************************************"
    puts"\n{CRASH!!!}"
  end

  def set_x_position
    puts "\nAgh! My lens are broken! What's my x coordinate (width)? (max value: #{plateau.grid_width})"
    x_input = gets.chomp.to_i
    x_input > plateau.grid_width ? rover.current_width = plateau.grid_width : rover.current_width = x_input
    position_inputs[0] = rover.current_width
  end

  def set_y_position
    puts "And what's my y coordinate (height)? (max value: #{plateau.grid_height})"
    y_input = gets.chomp.to_i
    y_input > plateau.grid_height ? rover.current_height = plateau.grid_height : rover.current_height = y_input
    position_inputs[1] = rover.current_height
  end

  def set_orientation
    valid_letters = ["n", "s", "e", "w"]

    puts "Got it! But...where am I facing? (Assign a cardinal point letter for the rover ~> N, S, E or W)"
    rover.orientation_letter = gets.chomp.upcase # while orientation is not a cardinal point >> Please type N, S, E or W
    position_inputs[2] = rover.orientation_letter
    puts "\n*********************************************************"
    puts "I can see it clearly now! My starting position is: #{rover.current_width} #{rover.current_height} #{rover.orientation_letter} !"
    puts '*********************************************************'
  end

  def print_commands
    puts "\n*************************************************************************************"
    puts "All set! What's my command sequence? You can choose any from among these (ex: MRML) :"
    puts 'M - Move forward'
    puts 'R - Turn right'
    puts 'L - Turn left'
    puts '*************************************************************************************'
  end

  def set_movement(movement_inputs)
    movements = []

    movements << movement_inputs.upcase
    position_inputs[3] = movements.join
    position_inputs[3].each_char do |input|
      case input
      when 'M' then @rover.move_foward
      when 'R' then @rover.turn_right
      when 'L' then @rover.turn_left
      end
    end
  end

  def status_report 
    puts "\n************************************************************"
    puts "Gotcha! Let's recap now. These were your inputs:"
    puts "\nPlateau grid size (x y): #{plateau.grid_width} #{plateau.grid_height}"
    puts "Rover's starting position: #{position_inputs[0]} #{position_inputs[1]} #{position_inputs[2]}"
    puts "Movement commands you issued: #{position_inputs[3]}"
    puts "And this is my final position: #{rover.current_width} #{rover.current_height} #{rover.orientation_letter} !"
    puts "************************************************************"
    puts "\nI'm going away now but I'm sending another rover to this grid unless you type 'STOP'. "
  end

  def send_another(answer)
    puts "\nOk then! Sending a new rover in 3...2..1"
    puts "\nNew rover: Hi there! {CRASH!!!}"
  end

end