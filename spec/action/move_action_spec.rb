require_relative '../spec_helper.rb'

describe MoveAction do
  let(:game) { instance_double(Game, width: 10, height: 10) }
  let(:vehicle) { Tank.new(game) }
  subject(:action) { MoveAction.new(game, vehicle) }

  describe '#execute' do
    context 'without collision' do
      before { allow(game).to receive(:collision?).and_return(false) }

      it 'should move rover to new position' do
        vehicle.set_position(10, 10, 0)
        expect(vehicle).to receive(:set_position).with(10, 8)
        action.execute
      end

      it 'should not allow x & y to turn negative' do
        vehicle.set_position(1, 1, -40)
        expect(vehicle).to receive(:set_position).with(1, 1)
        action.execute
      end

      it 'should not slide on y axis' do
        vehicle.set_position(0, 1, -40)
        expect(vehicle).to receive(:set_position).with(0, 1)
        action.execute
      end

      it 'should not slide on x axis' do
        vehicle.set_position(1, 0, -40)
        expect(vehicle).to receive(:set_position).with(1, 0)
        action.execute
      end

      it 'should not allow x & y to be greater than the size of game window' do
        vehicle.set_position(game.width, game.height, 120)
        expect(vehicle).to receive(:set_position).with(game.width, game.height)
        action.execute
      end

      it 'should not slide on right border' do
        vehicle.set_position(game.width, game.height, 80)
        expect(vehicle).to receive(:set_position).with(game.width, game.height)
        action.execute
      end

      it 'should not slide on south border' do
        vehicle.set_position(game.width, game.height, 200)
        expect(vehicle).to receive(:set_position).with(game.width, game.height)
        action.execute
      end
    end

    context 'with collision' do
      before { allow(game).to receive(:collision?).and_return(true) }

      it 'should not move if collision is detected' do
        action.execute
        expect(vehicle).not_to receive(:set_position)
      end
    end
  end
end
