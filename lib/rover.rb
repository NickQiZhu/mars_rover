require_relative 'visual_element'
require_relative 'move_command'
require_relative 'left_turn_command'

class Rover < VisualElement
  Z_INDEX = 1

  attr_reader :x, :y, :angle

  def initialize(game)
    super game
    @x = 320
    @y = 240
    @angle = 0
    @image = Gosu::Image.new('media/rover.bmp')
  end

  def position(x, y)
    @x = x
    @y = y
  end

  def draw
    image.draw_rot(@x, @y, Z_INDEX, @angle)
  end

  def move
    BaseCommand::STEPS.times {
      @game.cmd_queue << MoveCommand.new(self)
    }
  end

  def turn_left
    BaseCommand::STEPS.times {
      @game.cmd_queue << LeftTurnCommand.new(self)
    }
  end

  def turn(degree)
    @angle += degree
  end

  def update
    if Gosu::button_down?(Gosu::KbUp)
      move
    end

    if Gosu::button_down?(Gosu::KbLeft)
      turn_left
    end
  end
end