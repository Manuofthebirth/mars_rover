require 'spec_helper'
require_relative '../lib/app'

describe App do

  let(:rover) { App.new(Rover.new(0, 0, 'N'), Plateau.new(8, 6)) }

  describe 'Deploy Rover' do  
    it 'starts without raising an error' do
      expect { rover }.not_to raise_error
    end
  end

end