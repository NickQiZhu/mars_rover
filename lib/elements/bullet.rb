require_relative 'visual_element'
require_relative '../actions/move_action'
require_relative '../actions/explosion_action'
require_relative '../traits/explosive'

class Bullet < VisualElement

  include Explosive

  def initialize(game)
    super game
    @width = 20
    @height = 20
  end

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
    enqueue_action(ExplosionAction)
  end

  def move
    enqueue_action(MoveAction)
  end

end