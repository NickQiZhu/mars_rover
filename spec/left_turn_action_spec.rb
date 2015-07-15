require 'spec_helper.rb'

describe LeftTurnAction do
  let(:vehicle) { instance_double(Tank) }
  subject(:action) { LeftTurnAction.new(vehicle) }

  describe '#initialize' do
    it 'should change angle -4.5 degrees' do
      expect(action.degree).to eq(-TurnAction::TURN_ANGLE)
    end
  end
end
