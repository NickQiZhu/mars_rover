require_relative 'visual_element'
require_relative 'move_command'
require_relative 'left_turn_command'
require_relative 'right_turn_command'

class Rover < VisualElement
  Z_INDEX = 1

  attr_reader :x_pos, :y_pos, :angle

  def initialize(game)
    super game
    @x_pos = 320
    @y_pos = 240
    @angle = 0
    @image = Gosu::Image.new('media/rover.bmp')
  end

  def position(x, y)
    @x_pos = x
    @y_pos = y
  end

  def draw
    image.draw_rot(x_pos, y_pos, Z_INDEX, @angle)
  end

  def move
    BaseCommand.enqueue(@game.cmd_queue) { MoveCommand.new(self) }
  end

  def turn_left
    BaseCommand.enqueue(@game.cmd_queue) { LeftTurnCommand.new(self) }
  end

  def turn_right
    BaseCommand.enqueue(@game.cmd_queue) { RightTurnCommand.new(self) }
  end

  def turn(degree)
    @angle += degree
  end

  def update
    move if Gosu::button_down?(Gosu::KbUp)

    turn_left if Gosu::button_down?(Gosu::KbLeft)

    turn_right if Gosu::button_down?(Gosu::KbRight)
  end
end