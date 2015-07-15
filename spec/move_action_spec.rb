require 'spec_helper.rb'

describe MoveAction do
  let(:vehicle) { instance_double(Tank, x_pos: 10, y_pos: 10, angle: 0) }
  subject(:action) { MoveAction.new(vehicle) }

  describe '#execute' do
    it 'should move rover to new position' do
      expect(vehicle).to receive(:set_position).with(10, 8)
      action.execute
    end
  end
end
