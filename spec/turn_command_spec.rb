require 'spec_helper.rb'

describe TurnCommand do
  let(:rover) { instance_double(Rover, x: 10, y: 10, angle: 0) }
  subject(:cmd) { TurnCommand.new(rover, 10) }

  describe '#execute' do
    it 'should move change rover angle' do
      expect(rover).to receive(:turn).with(10)
      cmd.execute
    end
  end
end
