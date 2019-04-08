require 'spec_helper'
require_relative '../lib/rover'

describe Rover do
  
  describe 'Facing North' do
    let(:rover) { Rover.new(1, 4, 'N', Plateau.new(3, 4)) }

    it "faces EAST when turning right" do
      rover.turn_right
      expect(rover.orientation_letter).to eq 'E'
    end

    it "faces WEST when turning left" do
      rover.turn_left
      expect(rover.orientation_letter).to eq 'W'
    end

    it "respects the grid limits" do
      rover.move_foward
      expect(rover.current_height).to eq 4
    end
  end

  describe 'Facing South' do  
    let(:rover) { Rover.new(1, 0, 'S', Plateau.new(3, 4)) }

    it "faces WEST when turning right" do
      rover.turn_right
      expect(rover.orientation_letter).to eq 'W'
    end

    it "faces EAST when turning left" do
      rover.turn_left
      expect(rover.orientation_letter).to eq 'E'
    end

    it "respects the grid limits" do
      rover.move_foward
      expect(rover.current_height).to eq 0
    end
  end

  describe 'Facing East' do  
    let(:rover) { Rover.new(3, 2, 'E', Plateau.new(3, 4)) }

    it "faces SOUTH when turning right" do
      rover.turn_right
      expect(rover.orientation_letter).to eq 'S'
    end

    it "faces NORTH when turning left" do
      rover.turn_left
      expect(rover.orientation_letter).to eq 'N'
    end

    it "respects the grid limits" do
      rover.move_foward
      expect(rover.current_width).to eq 3
    end
  end

  describe 'Facing West' do  
    let(:rover) { Rover.new(0, 2, 'W', Plateau.new(3, 4)) }

    it "faces NORTH when turning right" do
      rover.turn_right
      expect(rover.orientation_letter).to eq 'N'
    end

    it "faces SOUTH when turning left" do
      rover.turn_left
      expect(rover.orientation_letter).to eq 'S'
    end

    it "respects the grid limits" do
      rover.move_foward
      expect(rover.current_width).to eq 0
    end
  end

end



