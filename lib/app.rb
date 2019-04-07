require_relative "plateau"
require_relative "rover"
require 'pry-byebug'

class App
  attr_accessor :rover, :commands, :movements

  def initialize(rover)
    @rover = rover
    @commands = []
    @movements = []
  end

  def run
    loop do
      starting_position
      print_commands
      movement_input = gets.chomp
      movement_command(movement_input)
      # send_another
    end
  end

  private

  def starting_position
    puts 'Welcome to the Jurassic Par...Mars Rover Problem! First, assign the starting point for your rover (width):'
    rover.current_width = gets.chomp.to_i
    puts 'Now assign the starting point for your rover (height):'
    rover.current_height = gets.chomp.to_i
    puts 'And now assign an orientation letter for your rover (N, S, E or W):'
    orientation = gets.chomp
    rover.orientation_letter = orientation.upcase
    puts "\n---"
    puts "Thank you! Your rover starting position is: #{rover.current_width} #{rover.current_height} #{rover.orientation_letter} !"
    puts "---"
  end

  def print_commands
    puts 'Lastly, insert the movement commands for your rover (ex: MRML or ENTER) :'
    puts 'M - Move forward'
    puts 'R - Turn right'
    puts 'L - Turn left'
    puts 'Press ENTER - Exit'
  end

  def movement_command(movement_input)
    movements << movement_input.upcase
    movements_sequence = movements.join
    movements_sequence.each_char do |input|
      case input
      when 'M' then @rover.move
      when 'R' then @rover.turn_right
      when 'L' then @rover.turn_left
      break if input == '' 
      else
        puts "Please type M, R, L or press ENTER to exit"
      end
    end
    puts "\n---"
    puts "All right! Your rover current position changed to: #{rover.current_width} #{rover.current_height} #{rover.orientation_letter} !"
    puts "---"
  end

  # def send_another
  #   puts "Send another rover (y/?n)"
  #   answer = gets.chomp
  #   if answer == 'y' || 'Y'
  #     // repeat loop and reset values
  #   elsif answer == 'n' || 'N'
  #     puts "Bye bye! Safe Travels!"
  #     // break loop
  #   else
  #     // repeat message
  #   end
  # end

end