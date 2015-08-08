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
    it 'should enqueue move action' do
      bullet.update(0, 0)
      expect(bullet.action_queue.last).to be_a(MoveAction)
    end
  end
end
