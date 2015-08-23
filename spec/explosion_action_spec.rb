require 'spec_helper.rb'

describe ExplosionAction do
  let(:game) { Game.new }
  let(:bullet) { Bullet.new(game) }
  subject(:action) { ExplosionAction.new(game, bullet) }

  describe '#execute' do
    before(:each) { game.elements << bullet }

    it 'should trigger #explode!' do
      action.execute
      expect(bullet.exploded?).to be_truthy
    end
  end
end
