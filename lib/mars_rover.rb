require_relative 'plateau'
require_relative 'rover'
require_relative 'app'

plateau = Plateau.new
rover = Rover.new(plateau)
app = App.new(rover, plateau)
puts "Welcome to the Jurassic Par...Mars Rover Problem! I am the NASA rover interface. Time to explore Mars!"
app.run
puts "\nBye bye then! Safe travels!"