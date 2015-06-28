require 'spec_helper.rb'

describe LeftTurnAction do
  let(:rover) { instance_double(Rover) }
  subject(:action) { LeftTurnAction.new(rover) }

  describe '#initialize' do
    it 'should change angle -4.5 degrees' do
      expect(action.degree).to eq(-TurnAction::TURN_ANGLE)
    end
  end
end