require 'spec_helper.rb'

describe MoveCommand do
  let(:rover) { instance_double(Rover, x: 10, y: 10) }
  subject(:cmd) { MoveCommand.new(rover, 0, 5) }

  describe '#execute' do
    it 'should move rover to new position' do
      expect(rover).to receive(:position).with(10, 15)
      cmd.execute
    end
  end
end
