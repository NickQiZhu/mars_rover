require_relative 'visual_element'

class Background < VisualElement
  Z_INDEX = 0

  protected

  def load_image
    @image = Gosu::Image.new('media/surface.png', :tileable => true)
  end

  def draw_image
    @image.draw(0, 0, Z_INDEX)
  end
end