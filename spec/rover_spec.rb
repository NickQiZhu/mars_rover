require 'spec_helper.rb'

describe Rover do
  let(:game) { Game.new }
  subject(:rover) { Rover.new(game) }

  describe '#initialize' do
    it 'should set initial position' do
      expect(rover.x).to be >= 0
      expect(rover.y).to be >= 0
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
      game.cmd_queue.each { |cmd| expect(cmd).to eq(MoveCommand.new(rover, 0, -5)) }
    end
  end

  describe '#draw' do
    let(:x) { 11 }
    let(:y) { 12 }

    before(:each) do
      rover.position x, y
    end

    it 'should draw image' do
      expect(rover.image).to receive(:draw).with(x, y, 1)
      rover.draw
    end
  end

  describe '#update' do
    it 'should trigger move if up button is pressed' do
      expect(Gosu).to receive(:button_down?).with(Gosu::KbUp).and_return(true)
      expect(rover).to receive(:move)
      rover.update
    end

    it 'should not trigger move if up button is not pressed' do
      expect(Gosu).to receive(:button_down?).with(Gosu::KbUp).and_return(false)
      expect(rover).to_not receive(:move)
      rover.update
    end
  end
end
