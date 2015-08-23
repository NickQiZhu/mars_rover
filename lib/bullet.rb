require_relative 'visual_element'
require_relative 'move_action'
require_relative 'explode_action'
require_relative 'explosive'

class Bullet < VisualElement

  def update(mouse_x, mouse_y)
    if moved?
      enqueue_action(MoveAction)
    else
      enqueue_action(ExplodeAction)
    end
  end

  def explode!
    @image = Explosive::IMAGE
    @exploded = true
  end

  def exploded?
    @exploded ||= false
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/bullet.png')
  end

end