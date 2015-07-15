require 'spec_helper.rb'

describe TurnAction do
  let(:vehicle) { instance_double(Tank, x_pos: 10, y_pos: 10, angle: 0) }
  subject(:action) { TurnAction.new(vehicle, 10) }

  describe '#execute' do
    it 'should move change rover angle' do
      expect(vehicle).to receive(:turn).with(10)
      action.execute
    end
  end
end
