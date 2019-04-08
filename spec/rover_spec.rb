require 'spec_helper'
require_relative '../lib/rover'

describe Rover do
  let(:rover) { Rover.new(0, 0, 'N') }
  

  describe 'Turn right' do
    it "faces EAST when facing NORTH" do
      expect(rover.turn_right(orientation_letter: 'N')).to eq 'E'
    end

    it "faces WEST when facing SOUTH" do
      expect(rover.turn_right(orientation_letter: 'S')).to eq 'W'
    end

    it "faces SOUTH when facing EAST" do
      expect(rover.turn_right(orientation_letter: 'E')).to eq 'S'
    end

    it "faces NORTH when facing WEST" do
      expect(rover.turn_right(orientation_letter: 'W')).to eq 'N'
    end
  end

  # describe 'Move' do
  #   it "does not exceed the grid limits" do
  #     expect(rover.turn_right(orientation_letter: 'N').to eq 'E'
  #   end
  # end

end