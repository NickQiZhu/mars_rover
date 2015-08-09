require 'spec_helper.rb'

describe MoveAction do
  let(:game) { instance_double(Game, width: 10, height: 10) }
  let(:vehicle) { Tank.new(game) }
  subject(:action) { MoveAction.new(game, vehicle) }

  describe '#execute' do
    it 'should move rover to new position' do
      vehicle.set_position(10, 10, 0)
      expect(vehicle).to receive(:set_position).with(10, 8)
      action.execute
    end

    it 'should not allow x & y to turn negative' do
      vehicle.set_position(1, 1, -40)
      expect(vehicle).to receive(:set_position).with(0, 0)
      action.execute
    end

    it 'should not allow x & y to be greater than the size of game window' do
      vehicle.set_position(game.width, game.height, 120)
      expect(vehicle).to receive(:set_position).with(game.width, game.height)
      action.execute
    end
  end
end
