require 'spec_helper.rb'

describe Background do
  let(:game) { instance_double(Game, width: 9, height: 9) }
  subject(:background) { Background.new(game) }

  describe '#initialize' do
    it 'should load background image' do
      expect(background.image).to be_a(Gosu::Image)
    end
  end

  describe '#draw' do
    it 'should draw background image if image is larger than game size' do
      expect_draw(mock_image(10, 11), 0, 0)
      background.draw
    end

    it 'should draw background image in tiles if image is small in both width and height' do
      image = mock_image(3, 3)

      [0, 3, 6].each do |y|
        [0, 3, 6].each do |x|
          expect_draw(image, x, y)
        end
      end

      background.draw
    end

    def expect_draw(image, x, y)
      expect(image).to receive(:draw).with(x, y, background.z_index)
    end

    def mock_image(h, w)
      background.image = instance_double(Gosu::Image, width: w, height: h)
    end
  end
end
