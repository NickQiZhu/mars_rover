require_relative 'visual_element'

class Background < VisualElement
  Z_INDEX = 0

  def initialize(game)
    super game
    @image = Gosu::Image.new('media/surface.png', :tileable => true)
  end

  def draw
    @image.draw(0, 0, Z_INDEX)
  end
end