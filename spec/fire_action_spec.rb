require 'spec_helper.rb'

describe FireAction do
  let(:game) { Game.new }
  let(:vehicle) { instance_double(Tank, x_pos: 10, y_pos: 20, angle: 7, width: 50, height: 50) }
  subject(:action) { FireAction.new(game, vehicle) }

  describe '#execute' do
    before(:each) { action.execute }

    it 'should add bullet element to the game' do
      bullet = game.elements.last
      expect(bullet).to be_a(Bullet)
    end

    it 'should set bullet element position to in front of the gun' do
      bullet = game.elements.last
      expect(bullet.x_pos).to be_within(0.1).of(16)
      expect(bullet.y_pos).to be_within(0.1).of(-29.6)
      expect(bullet.angle).to eq(vehicle.angle)
    end
  end
end
