require_relative 'visual_element'
require_relative 'positionable'
require_relative 'move_action'
require_relative 'left_turn_action'
require_relative 'right_turn_action'

class Tank < VisualElement
  include Positionable

  Z_INDEX = 1

  def initialize(game)
    super game
    set_position 320, 240, 0
  end

  def z_index
    1
  end

  def move
    BaseAction.enqueue(@action_queue) { MoveAction.new(game, self) }
  end

  def turn_left
    BaseAction.enqueue(@action_queue) { LeftTurnAction.new(game, self) }
  end

  def turn_right
    BaseAction.enqueue(@action_queue) { RightTurnAction.new(game, self) }
  end

  def update(mouse_x, mouse_y)
    move if pressed?(Gosu::KbUp)

    turn_left if pressed?(Gosu::KbLeft)

    turn_right if pressed?(Gosu::KbRight)
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/tank.png')
  end

  def draw_image
    image.draw_rot(x_pos, y_pos, z_index, angle)
  end

end