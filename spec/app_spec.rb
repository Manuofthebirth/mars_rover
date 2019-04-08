require 'spec_helper'
require_relative '../lib/app'

describe App do
  let(:rover) { App.new(Rover.new(0, 0, 'N', Plateau.new(5, 5))) }

  describe 'Deploy Rover' do  
    it 'starts without raising an error' do
      expect { rover }.not_to raise_error
    end
  end

end

# starting_position >>> expect 0 0 'N'
# current_width >> must be integer (.class)
# current_height >> must be integer (.class)
# orientation_letter >> must be a string (.class) + must not be empty
# orientation_letter >> can only accept cardinal points [N, S, E, W] (capital letter)

# movement_command >> expect 'LMLMLMLMM' + 1 2 'N' to return 1 3 'N'
# movement_command >> expect 'MMRMMRMRRM' + 3 3 'E' to return 5 1 'E'

# movement_command(movement_input)
# movement_command('LMLMLMLMM') >> 'L M L M L M L M M' (rover must receive your commands individually)
# movement_command('LMLM LMLMM') >> 'L M L M L M L M M' (it ignores empty spaces inside a input)


# send_another >> all rovers must behave the same way

# starting_position >>> expect 0 0 'N'
# movement_command >> expect 'LMLMLMLMM' + 1 2 'N' to return 1 3 'N'
# movement_command >> expect 'MMRMMRMRRM' + 3 3 'E' to return 5 1 'E'