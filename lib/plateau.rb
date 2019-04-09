class Plateau
  attr_accessor :x_limit, :y_limit

  def initialize(x_limit = 5, y_limit = 5)
    @x_limit = x_limit
    @y_limit = y_limit
  end
  
end