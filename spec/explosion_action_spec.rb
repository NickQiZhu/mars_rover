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

    it 'should enqueue time delayed elimination action' do
      action.execute
      action = bullet.last_action
      expect(action).to be_a(TimedAction)
      expect(action.delegate).to be_a(EliminationAction)
    end
  end
end
