require 'spec_helper.rb'

describe RightTurnAction do
  let(:rover) { instance_double(Rover) }
  subject(:action) { RightTurnAction.new(rover) }

  describe '#initialize' do
    it 'should change angle 4.5 degrees' do
      expect(action.degree).to eq(TurnAction::TURN_ANGLE)
    end
  end
end
