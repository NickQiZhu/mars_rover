require_relative 'visual_element'
require_relative 'move_action'

class Bullet < VisualElement

  def update(mouse_x, mouse_y)
    enqueue_action(MoveAction)
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/bullet.png')
  end

end