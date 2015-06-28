require_relative 'visual_element'
require_relative 'move_action'
require_relative 'left_turn_action'
require_relative 'right_turn_action'

class Rover < VisualElement
  Z_INDEX = 1

  attr_reader :x_pos, :y_pos, :angle

  def initialize(game)
    super game
    position 320, 240, 0
  end

  def position(x, y, angle = nil)
    @x_pos = x
    @y_pos = y
    @angle = angle if angle
  end

  def move
    BaseAction.enqueue(@action_queue) { MoveAction.new(self) }
  end

  def turn_left
    BaseAction.enqueue(@action_queue) { LeftTurnAction.new(self) }
  end

  def turn_right
    BaseAction.enqueue(@action_queue) { RightTurnAction.new(self) }
  end

  def turn(degree)
    @angle += degree
  end

  def update
    move if Gosu::button_down?(Gosu::KbUp)

    turn_left if Gosu::button_down?(Gosu::KbLeft)

    turn_right if Gosu::button_down?(Gosu::KbRight)
  end

  protected

  def load_image
    @image = Gosu::Image.new('media/rover.bmp')
  end

  def draw_image
    image.draw_rot(x_pos, y_pos, Z_INDEX, @angle)
  end

end