require_relative 'visual_element'
require_relative '../traits/positionable'

class Mouse < VisualElement
  include Positionable

  def initialize(game)
    super game
    @width = 95
    @height = 95
  end

  def z_index
    100
  end

  def update(mouse_x, mouse_y)
    self.x = mouse_x
    self.y = mouse_y
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/mouse.gif')
  end

  def draw_image
    @image.draw(x, y, z_index)
  end
end