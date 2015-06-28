require 'spec_helper.rb'

describe TurnAction do
  let(:rover) { instance_double(Rover, x_pos: 10, y_pos: 10, angle: 0) }
  subject(:action) { TurnAction.new(rover, 10) }

  describe '#execute' do
    it 'should move change rover angle' do
      expect(rover).to receive(:turn).with(10)
      action.execute
    end
  end
end
