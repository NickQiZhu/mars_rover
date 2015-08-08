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
end
