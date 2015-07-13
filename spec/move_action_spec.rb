require 'spec_helper.rb'

describe MoveAction do
  let(:rover) { instance_double(Tank, x_pos: 10, y_pos: 10, angle: 0) }
  subject(:action) { MoveAction.new(rover) }

  describe '#execute' do
    it 'should move rover to new position' do
      expect(rover).to receive(:set_position).with(10, 8)
      action.execute
    end
  end
end
