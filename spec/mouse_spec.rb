require 'spec_helper.rb'

describe Mouse do
  include ImageHelper

  let(:game) { instance_double(Game) }
  subject(:mouse) { Mouse.new(game) }

  describe '#initialize' do
    it 'should load cursor image' do
      expect(mouse.image).to be_a(Gosu::Image)
    end
  end

  describe '#draw' do
    it 'should draw' do
      x = 101; y = 204
      mouse.set_position(x, y)
      expect_draw(mock_image, x, y, mouse.z_index)
      mouse.draw
    end
  end
end
