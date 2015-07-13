require 'spec_helper.rb'

describe Tank do
  let(:game) { Game.new }
  subject(:rover) { Tank.new(game) }

  describe '#initialize' do
    it 'should set initial position' do
      expect(rover.x_pos).to be >= 0
      expect(rover.y_pos).to be >= 0
    end

    it 'should load image' do
      expect(rover.image).to_not be_nil
    end
  end

  describe 'movement method' do
    [{method: :move, action: MoveAction},
     {method: :turn_left, action: LeftTurnAction},
     {method: :turn_right, action: RightTurnAction}
    ].each do |test_case|
      it "#{test_case[:method]} should enqueue #{test_case[:action]} actions" do
        rover.send(test_case[:method])
        expect(rover.action_queue.size).to eq(MoveAction::STEPS)
        rover.action_queue.each { |cmd| expect(cmd).to eq(test_case[:action].new(rover)) }
      end
    end
  end

  describe '#update' do
    before(:each) do
      allow(Gosu).to receive(:button_down?).and_return(false)
    end

    [{key_pressed: Gosu::KbUp, action_to_trigger: :move},
     {key_pressed: Gosu::KbLeft, action_to_trigger: :turn_left},
     {key_pressed: Gosu::KbRight, action_to_trigger: :turn_right}
    ].each do |test_case|
      it "should trigger #{test_case[:action_to_trigger]} if #{test_case[:key_pressed]} button is pressed" do
        expect(Gosu).to receive(:button_down?).with(test_case[:key_pressed]).and_return(true)
        expect(rover).to receive(test_case[:action_to_trigger])
        rover.update(0,0)
      end
    end
  end

  context 'position related methods' do
    let(:x) { 10 }; let(:y) { 15 }; let(:angle) { 4 }

    describe '#position' do
      it 'should set x, y, angle directly' do
        rover.set_position x, y, angle
        expect(rover.x_pos).to eq(x)
        expect(rover.y_pos).to eq(y)
        expect(rover.angle).to eq(angle)
      end

      it 'should ignore angle if not given' do
        rover.set_position x, y, angle
        rover.set_position x, y
        expect(rover.angle).to eq(angle)
      end
    end

    describe '#turn' do
      it 'should change rover angle by given degree' do
        rover.turn(angle)
        expect(rover.angle).to eq(angle)
      end
    end

    describe '#draw' do
      before(:each) do
        allow(rover.image).to receive(:draw_rot)
        rover.set_position x, y
        rover.turn(angle)
      end

      it 'should draw image' do
        expect(rover.image).to receive(:draw_rot).with(x, y, rover.z_index, angle)
        rover.draw
      end
    end
  end

end
