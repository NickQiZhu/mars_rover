require 'spec_helper.rb'

describe RightTurnCommand do
  let(:rover) { instance_double(Rover) }
  subject(:cmd) { RightTurnCommand.new(rover) }

  describe '#initialize' do
    it 'should change angle 4.5 degrees' do
      expect(cmd.degree).to eq(TurnCommand::TURN_ANGLE)
    end
  end
end
