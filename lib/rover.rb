require_relative 'visual_element'
require_relative 'move_command'

class Rover < VisualElement
  Z_INDEX = 1

  attr_reader :x, :y

  def initialize(game)
    super game
    @x = 320
    @y = 240
    @image = Gosu::Image.new('media/rover.bmp')
  end

  def position(x, y)
    @x = x
    @y = y
  end

  def draw
    image.draw(@x, @y, Z_INDEX)
  end

  def move
    MOVEMENT_STEPS.times {
      @game.cmd_queue << MoveCommand.new(self, 0, MOVEMENT_STEP_SIZE)
    }
  end

  def turn_left
    MOVEMENT_STEPS.times {
      @game.cmd_queue << TurnCommand.new(self, -33)
    }
  end

  def update
    if Gosu::button_down?(Gosu::KbUp)
      move
    end
  end
end