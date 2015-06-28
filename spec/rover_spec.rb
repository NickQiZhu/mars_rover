require 'spec_helper.rb'

describe Rover do
  let(:game) { Game.new }
  subject(:rover) { Rover.new(game) }

  describe '#initialize' do
    it 'should set initial position' do
      expect(rover.x_pos).to be >= 0
      expect(rover.y_pos).to be >= 0
    end

    it 'should load image' do
      expect(rover.image).to_not be_nil
    end
  end

  describe '#position' do
    let(:x) { 10 }; let(:y) { 15 }; let(:angle) { 4 }

    it 'should set x, y, angle directly' do
      rover.position x, y, angle
      expect(rover.x_pos).to eq(x)
      expect(rover.y_pos).to eq(y)
      expect(rover.angle).to eq(angle)
    end

    it 'should ignore angle if not given' do
      rover.position x, y, angle
      rover.position 1, 1
      expect(rover.angle).to eq(angle)
    end
  end

  describe '#move' do
    it 'should enqueue a series of position command' do
      rover.move
      expect(rover.action_queue.size).to eq(MoveCommand::STEPS)
      rover.action_queue.each { |cmd| expect(cmd).to eq(MoveCommand.new(rover)) }
    end
  end

  describe '#turn_left' do
    it 'should generate a series of left turn command' do
      rover.turn_left
      expect(rover.action_queue.size).to eq(TurnCommand::STEPS)
      rover.action_queue.each { |cmd| expect(cmd).to eq(LeftTurnCommand.new(rover)) }
    end
  end

  describe '#turn_right' do
    it 'should generate a series of right turn command' do
      rover.turn_right
      expect(rover.action_queue.size).to eq(TurnCommand::STEPS)
      rover.action_queue.each { |cmd| expect(cmd).to eq(RightTurnCommand.new(rover)) }
    end
  end

  describe '#turn' do
    it 'should change rover angle by given degree' do
      rover.turn(10)
      expect(rover.angle).to eq(10)
    end
  end

  describe '#draw' do
    let(:x) { 11 }; let(:y) { 12 }; let(:angle) { 33 }

    before(:each) do
      rover.position x, y
      rover.turn(angle)
    end

    it 'should draw image' do
      expect(rover.image).to receive(:draw_rot).with(x, y, Rover::Z_INDEX, angle)
      rover.draw
    end
  end

  describe '#update' do
    before(:each) do
      allow(Gosu).to receive(:button_down?).and_return(false)
    end

    context 'move' do
      it 'should be triggered if up button is pressed' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KbUp).and_return(true)
        expect(rover).to receive(:move)
        rover.update
      end

      it 'should not be triggered if up button is not pressed' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KbUp).and_return(false)
        expect(rover).to_not receive(:move)
        rover.update
      end
    end

    context 'turn left' do
      it 'should be triggered if left button is pressed' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KbLeft).and_return(true)
        expect(rover).to receive(:turn_left)
        rover.update
      end

      it 'should not be triggered if left button is not pressed' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KbLeft).and_return(false)
        expect(rover).to_not receive(:turn_left)
        rover.update
      end
    end

    context 'turn right' do
      it 'should be triggered if right button is pressed' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KbRight).and_return(true)
        expect(rover).to receive(:turn_right)
        rover.update
      end

      it 'should not be triggered if right button is not pressed' do
        expect(Gosu).to receive(:button_down?).with(Gosu::KbRight).and_return(false)
        expect(rover).to_not receive(:turn_right)
        rover.update
      end
    end
  end
end
