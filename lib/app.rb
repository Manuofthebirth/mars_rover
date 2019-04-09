require_relative "plateau"
require_relative "rover"

class App
  attr_accessor :rover, :plateau, :user_inputs

  def initialize(rover, plateau)
    @rover = rover
    @plateau = plateau
    @user_inputs = []
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
      answer = gets.chomp.upcase
      if answer == 'STOP'
        break
      end
      send_another(answer)
    end
  end

  private

  def set_grid
    puts "\nLet's define the Plateau grid size first. What's the grid width limit (x coordinate)?"
    max_x = gets.chomp.to_i
    max_x <= 0 ? plateau.x_limit = 5 : plateau.x_limit = max_x

    puts "And what's the grid height limit (y coordinate)?"
    max_y = gets.chomp.to_i
    max_y <= 0 ? plateau.y_limit = 5 : plateau.y_limit = max_y

    puts "\n> Ok! The Plateau grid limits are: #{plateau.x_limit} (x: width) #{plateau.y_limit} (y: height) ! <"
    puts"\n{CRASH!!!}"
  end

  def set_x_position
    puts "\nAgh! My lens are broken! What's my x coordinate (width)? (max value: #{plateau.x_limit})"
    x_input = gets.chomp.to_i
    x_input > plateau.x_limit ? rover.x_coordinate = plateau.x_limit : rover.x_coordinate = x_input
    user_inputs[0] = rover.x_coordinate
  end

  def set_y_position
    puts "And what's my y coordinate (height)? (max value: #{plateau.y_limit})"
    y_input = gets.chomp.to_i
    y_input > plateau.y_limit ? rover.y_coordinate = plateau.y_limit : rover.y_coordinate = y_input
    user_inputs[1] = rover.y_coordinate
  end

  def set_orientation
    valid_letters = ["N", "S", "E", "W"]

    puts "Got it! But...where am I facing? (Assign a cardinal compass point for the rover ~> N, S, E or W)"
    letter_input = gets.chomp.upcase 
    valid_letters.include?(letter_input) ? rover.compass_point = letter_input : rover.compass_point = valid_letters.sample
    user_inputs[2] = rover.compass_point
    puts "\n> I can see it clearly now! My starting position is: #{rover.x_coordinate} #{rover.y_coordinate} #{rover.compass_point} ! <"
  end

  def print_commands
    puts "\n************************************************"
    puts "All set! What's my command sequence (ex: MRML) ?"
    puts 'M - Move forward'
    puts 'R - Turn right'
    puts 'L - Turn left'
    puts '************************************************'
  end

  def set_movement(movement_inputs)
    movements = []

    movement_inputs.split('').each { |i| movements << i.upcase }
    valid_commands = movements.select { |m| m =~ /[MRL]/ } 
    user_inputs[3] = valid_commands.join
    user_inputs[3].each_char do |input|
      case input
      when 'M' then @rover.move_foward
      when 'R' then @rover.turn_right
      when 'L' then @rover.turn_left
      end
    end
  end

  def status_report 
    puts "\n************************************************"
    puts "Gotcha! Let's recap now. These were your inputs:"
    puts "\nPlateau grid size (x y): #{plateau.x_limit} #{plateau.y_limit}"
    puts "Rover's starting position: #{user_inputs[0]} #{user_inputs[1]} #{user_inputs[2]}"
    puts "Movement commands you issued: #{user_inputs[3]}"
    puts "And this is my final position: #{rover.x_coordinate} #{rover.y_coordinate} #{rover.compass_point} !"
    puts "************************************************"
    puts "\nI'm going away now but I'm sending another rover to this grid unless you type STOP."
  end

  def send_another(answer)
    puts "\nOk then! Sending a new rover in 3...2..1; New rover: Hi there! {CRASH!!!}"
  end

end