require 'spec_helper.rb'

describe Rover do
  let(:game){Game.new}
  subject(:rover) { Rover.new(game) }

  describe '#initialize' do
    it 'should set position to (0, 0)' do
      expect(rover.x).to eq(0)
      expect(rover.y).to eq(0)
    end

    it 'should load image' do
      expect(rover.image).to_not be_nil
    end
  end

  describe '#position' do
    it 'should set x, y directly' do
      rover.position 10, 15
      expect(rover.x).to eq(10)
      expect(rover.y).to eq(15)
    end
  end

  describe '#move' do
    it 'should enqueue a series of position command' do
      rover.move
      expect(game.cmd_queue.size).to eq(3)
      expect(game.cmd_queue.first).to eq(MoveCommand.new(0, -5))
    end
  end

  describe '#draw' do
    let(:x){11}
    let(:y){12}

    before(:each) do
      rover.position x, y
    end

    it 'should draw image' do
      expect(rover.image).to receive(:draw).with(x, y, 1)
      rover.draw
    end
  end
end
