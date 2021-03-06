require_relative '../spec_helper.rb'

describe TurnAction do
  let(:game) { instance_double(Game) }
  let(:vehicle) { instance_double(Tank, x: 10, y: 10, angle: 0) }
  subject(:action) { TurnAction.new(game, vehicle, 10) }

  describe '#execute' do
    it 'should move change rover angle' do
      expect(vehicle).to receive(:turn).with(10)
      action.execute
    end
  end
end
