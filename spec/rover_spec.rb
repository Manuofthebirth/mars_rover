require 'spec_helper'
require_relative '../lib/plateau'
require_relative '../lib/rover'

describe Rover do

  let(:rover) { Rover.new(coordinate_x: 0, coordinate_y: 0, orientation_letter: 'N') }

  describe '#initialize' do
    it 'should create a new rover instance' do
      expect(rover).to be_a(Rover)
    end
  end

end