require_relative '../spec_helper.rb'

describe Mouse do
  include TestUtils

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
      expect_draw(image_double, x, y, mouse.z_index)
      mouse.draw
    end
  end

  describe '#update' do
    it 'should set mouse position' do
      x = 101; y = 204
      mouse.update(x, y)
      expect(mouse.x).to eq(x)
      expect(mouse.y).to eq(y)
    end
  end
end
