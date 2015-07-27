require 'spec_helper.rb'

describe Tank do
  let(:game) { Game.new }
  subject(:vehicle) { Tank.new(game) }

  describe '#initialize' do
    it 'should set initial position' do
      expect(vehicle.x_pos).to be >= 0
      expect(vehicle.y_pos).to be >= 0
    end

    it 'should load image' do
      expect(vehicle.image).to_not be_nil
    end
  end

  describe 'movement method' do
    [{method: :move, action: MoveAction},
     {method: :turn_left, action: LeftTurnAction},
     {method: :turn_right, action: RightTurnAction}
    ].each do |test_case|
      it "#{test_case[:method]} should enqueue #{test_case[:action]} actions" do
        vehicle.send(test_case[:method])
        expect(vehicle.action_queue.size).to eq(MoveAction::STEPS)
        vehicle.action_queue.each { |cmd| expect(cmd).to eq(test_case[:action].new(game, vehicle)) }
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
        expect(vehicle).to receive(test_case[:action_to_trigger])
        vehicle.update(0,0)
      end
    end
  end

  context 'position related methods' do
    let(:x) { 10 }; let(:y) { 15 }; let(:angle) { 4 }

    describe '#position' do
      it 'should set x, y, angle directly' do
        vehicle.set_position x, y, angle
        expect(vehicle.x_pos).to eq(x)
        expect(vehicle.y_pos).to eq(y)
        expect(vehicle.angle).to eq(angle)
      end

      it 'should ignore angle if not given' do
        vehicle.set_position x, y, angle
        vehicle.set_position x, y
        expect(vehicle.angle).to eq(angle)
      end
    end

    describe '#turn' do
      it 'should change vehicle angle by given degree' do
        vehicle.turn(angle)
        expect(vehicle.angle).to eq(angle)
      end
    end

    describe '#draw' do
      before(:each) do
        allow(vehicle.image).to receive(:draw_rot)
        vehicle.set_position x, y
        vehicle.turn(angle)
      end

      it 'should draw image' do
        expect(vehicle.image).to receive(:draw_rot).with(x, y, vehicle.z_index, angle)
        vehicle.draw
      end
    end
  end

end
