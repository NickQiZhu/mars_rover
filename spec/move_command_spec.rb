require 'spec_helper.rb'

describe MoveCommand do
  let(:rover) { instance_double(Rover, x_pos: 10, y_pos: 10, angle: 0) }
  subject(:cmd) { MoveCommand.new(rover) }

  describe '#execute' do
    it 'should move rover to new position' do
      expect(rover).to receive(:position).with(10, 8)
      cmd.execute
    end
  end
end
