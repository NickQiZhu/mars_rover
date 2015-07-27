require 'spec_helper.rb'

describe LeftTurnAction do
  let(:game) { instance_double(Game) }
  let(:vehicle) { instance_double(Tank) }
  subject(:action) { LeftTurnAction.new(game, vehicle) }

  describe '#initialize' do
    it 'should change angle -4.5 degrees' do
      expect(action.degree).to eq(-TurnAction::TURN_ANGLE)
    end
  end
end
