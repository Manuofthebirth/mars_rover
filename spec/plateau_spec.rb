require 'spec_helper'
require_relative '../lib/plateau'

describe Plateau do
  let(:plateau) { Plateau.new(2, 6) }
  

  describe 'Grid size' do
    it 'has a way to access the grid maximum width value' do
      expect(plateau.x_limit).to eq 2
    end

    it 'has a way to access the grid maximum height value' do
      expect(plateau.y_limit).to eq 6
    end
  end

end