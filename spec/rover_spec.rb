require 'spec_helper.rb'

describe Rover do
  subject(:rover) { Rover.new }

  describe '#initialize' do
    it 'should set position to (0, 0)' do
      expect(rover.x).to eq(0)
      expect(rover.y).to eq(0)
    end

    it 'should load image' do
      expect(rover.image).to_not be_nil
    end
  end

  describe '#teleport' do
    it 'should set x, y directly' do
      rover.teleport 10, 15
      expect(rover.x).to eq(10)
      expect(rover.y).to eq(15)
    end
  end
end
