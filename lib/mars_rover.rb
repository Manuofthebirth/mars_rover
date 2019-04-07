require_relative 'plateau'
require_relative 'rover'
require_relative 'app'

plateau = Plateau.new
rover = Rover.new(plateau)
app = App.new(rover)
app.run