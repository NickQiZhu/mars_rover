require 'spec_helper.rb'

describe Bullet do
  include ImageHelper

  let(:game) { instance_double(Game) }
  subject(:bullet) { Bullet.new(game) }

  describe '#initialize' do
    it 'should load background image' do
      expect(bullet.image).to be_a(Gosu::Image)
    end
  end

  describe '#update' do
    it 'should enqueue move action while moving' do
      expect(bullet).to receive(:moved?).and_return(true)
      bullet.update(0, 0)
      expect(bullet.last_action).to be_a(MoveAction)
    end

    it 'should enqueue explode action when stopped' do
      expect(bullet).to receive(:moved?).and_return(false)
      bullet.update(0, 0)
      action = bullet.last_action
      expect(action).to be_a(TimedAction)
      expect(action.delegate).to be_a(ExplosionAction)
    end
  end

  describe '#explode!' do
    it 'should change image to explosion.png' do
      bullet.explode!
      expect(bullet.image).to eq(Explosive::IMAGE)
    end

    it 'should not be exploded initially' do
      expect(bullet.exploded?).to be_falsey
    end

    it 'should change exploded flag to true' do
      bullet.explode!
      expect(bullet.exploded?).to be_truthy
    end
  end
end
