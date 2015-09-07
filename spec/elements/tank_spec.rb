require_relative '../spec_helper.rb'

describe Tank do
  let(:game) { Game.new }
  subject(:vehicle) { Tank.new(game) }

  describe '#initialize' do
    it 'should set initial position' do
      expect(vehicle.x).to be >= 0
      expect(vehicle.y).to be >= 0
    end

    it 'should load image' do
      expect(vehicle.image).to_not be_nil
    end
  end

  describe 'action method' do
    [{method: :move, action: MoveAction},
     {method: :turn_left, action: LeftTurnAction},
     {method: :turn_right, action: RightTurnAction},
     {method: :fire, action: FireAction}
    ].each do |test_case|
      it "#{test_case[:method]} should enqueue #{test_case[:action]} actions" do
        vehicle.send(test_case[:method])
        expect(vehicle.action_queue.size).to eq(MoveAction::STEPS)
        vehicle.action_queue.each { |cmd| expect(cmd).to eq(test_case[:action].new(game, vehicle)) }
      end
    end
  end

  describe '#gun_ready??' do
    it 'should return true initially' do
      expect(vehicle.gun_ready?).to be_truthy
    end

    it 'should return false right after firing' do
      vehicle.fire
      expect(vehicle.gun_ready?).to be_falsey
    end

    it 'quick consecutive firing should only trigger once' do
      3.times { vehicle.fire }
      expect(vehicle.action_queue.size).to eq(1)
    end
  end

  describe '#update' do
    before(:each) do
      allow(Gosu).to receive(:button_down?).and_return(false)
    end

    [{key_pressed: Gosu::KbUp, action_to_trigger: :move},
     {key_pressed: Gosu::KbLeft, action_to_trigger: :turn_left},
     {key_pressed: Gosu::KbRight, action_to_trigger: :turn_right},
     {key_pressed: Gosu::KbSpace, action_to_trigger: :fire}
    ].each do |test_case|
      it "should trigger #{test_case[:action_to_trigger]} if #{test_case[:key_pressed]} button is pressed" do
        expect(Gosu).to receive(:button_down?).with(test_case[:key_pressed]).and_return(true)
        expect(vehicle).to receive(test_case[:action_to_trigger])
        vehicle.update(0, 0)
      end
    end
  end

end
