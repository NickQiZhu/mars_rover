require 'spec_helper.rb'

describe MoveAction do
  let(:game) { Game.new }
  let(:bullet) { Bullet.new(game) }
  subject(:action) { ExplodeAction.new(game, bullet) }

  describe '#execute' do
    before(:each) { game.elements << bullet }

    it 'should remove bullet from the game' do
      action.execute
      expect(game.elements).to_not include(bullet)
    end
  end
end
