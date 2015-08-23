require_relative 'visual_element'
require_relative 'move_action'
require_relative 'explosion_action'
require_relative 'explosive'

class Bullet < VisualElement

  include Explosive

  def update(mouse_x, mouse_y)
    if moved?
      enqueue_action(MoveAction)
    else
      enqueue_action(ExplosionAction)
    end
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/bullet.png')
  end

end