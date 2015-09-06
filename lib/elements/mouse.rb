require_relative 'visual_element'
require_relative '../positionable'

class Mouse < VisualElement
  include Positionable

  def z_index
    100
  end

  def update(mouse_x, mouse_y)
    self.x_pos = mouse_x
    self.y_pos = mouse_y
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/mouse.gif')
  end

  def draw_image
    @image.draw(x_pos, y_pos, z_index)
  end
end