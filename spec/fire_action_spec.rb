require 'spec_helper.rb'

describe FireAction do
  let(:game) { instance_double(Game) }
  let(:vehicle) { instance_double(Tank, x_pos: 10, y_pos: 20, angle: 7) }
  subject(:action) { FireAction.new(game, vehicle) }

  describe '#execute' do
    it 'should add bullet element to the game' do
      action.execute
    end
  end
end
