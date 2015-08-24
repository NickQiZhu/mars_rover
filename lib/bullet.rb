require_relative 'visual_element'
require_relative 'move_action'
require_relative 'timed_action'
require_relative 'explosion_action'
require_relative 'explosive'

class Bullet < VisualElement

  include Explosive

  def update(mouse_x, mouse_y)
    moving? ? move : explode
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/bullet.png')
  end

  private

  def moving?
    moved?
  end

  def explode
    BaseAction.enqueue(@action_queue) do
      TimedAction.new(game, self, ExplosionAction.new(game, self))
    end
  end

  def move
    enqueue_action(MoveAction)
  end

end