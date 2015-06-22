require_relative 'visual_element'

class Background < VisualElement

  def initialize(game)
    super game
    @image = Gosu::Image.new('media/surface.png', :tileable => true)
  end

  def draw
    @image.draw(0, 0, 0)
  end
end