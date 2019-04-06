require 'spec_helper'
require_relative '../lib/plateau'

describe Plateau do

  let(:plateau) { Plateau.new(max_x: 5, max_y: 5) }

  describe '#initialize' do
    it 'should create a new plateau instance' do
      expect(plateau).to be_a(Plateau)
    end
  end
    
end