require_relative 'plateau'
require_relative 'rover'
require_relative 'app'

plateau = Plateau.new
rover = Rover.new(plateau)
app = App.new(rover)
puts "Welcome to the Jurassic Par...Mars Rover Problem! My name is Manoel and I'm here to help you guide your rover(s)."
puts ''
app.run
puts 'Bye bye! Safe travels!'