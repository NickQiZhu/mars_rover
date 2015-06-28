require 'spec_helper.rb'

describe LeftTurnCommand do
  let(:rover) { instance_double(Rover) }
  subject(:cmd) { LeftTurnCommand.new(rover) }

  describe '#execute' do
    it 'should change angle -4.5 degrees' do
      expect(cmd.degree).to eq(-TurnCommand::TURN_ANGLE)
    end
  end
end
