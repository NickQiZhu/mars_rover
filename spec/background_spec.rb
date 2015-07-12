require 'spec_helper.rb'

describe Background do
  GAME_WIDTH = 12
  GAME_HEIGHT = 15

  let(:game) { instance_double(Game, width: GAME_WIDTH, height: GAME_HEIGHT) }
  subject(:background) { Background.new(game) }

  describe '#initialize' do
    it 'should load background image' do
      expect(background.image).to be_a(Gosu::Image)
    end
  end

  describe '#draw' do
    [{w: 12, h: 15}, {w: 20, h: 20},
     {w: 20, h: 15}, {w: 12, h: 20}].each do |size|
      it %{should draw background image only once if image
            size(#{size[:w]},#{size[:h]}) with game size(#{GAME_WIDTH},#{GAME_HEIGHT})} do
        expect_draw(mock_image(size[:w], size[:h]), 0, 0)
        background.draw
      end
    end

    it 'should draw background image in tiles if image is small in both width and height' do
      image = mock_image(4, 5)

      [0, 5, 10].each do |y|
        [0, 4, 8].each do |x|
          expect_draw(image, x, y)
        end
      end

      background.draw
    end

    def expect_draw(image, x, y)
      expect(image).to receive(:draw).with(x, y, background.z_index)
    end

    def mock_image(w, h)
      background.image = instance_double(Gosu::Image, width: w, height: h)
    end
  end
end
