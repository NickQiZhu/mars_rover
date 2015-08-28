require 'spec_helper.rb'

describe Background do
  include TestHelper

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
      it %{should draw image only once if image has
            size(#{size[:w]},#{size[:h]}) and game has size(#{GAME_WIDTH},#{GAME_HEIGHT})} do
        expect_draw(mock_image(size[:w], size[:h]), 0, 0, background.z_index)
        background.draw
      end
    end

    it 'should tile image both horizontally and vertically if image is small in both width and height' do
      image = mock_image(5, 4)

      [0, 4, 8, 12].each do |y|
        [0, 5, 10].each do |x|
          expect_draw(image, x, y, background.z_index)
        end
      end

      background.draw
    end
  end
end
