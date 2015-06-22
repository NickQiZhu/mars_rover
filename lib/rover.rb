require_relative 'visual_element'
require_relative 'move_command'

class Rover < VisualElement
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
    image.draw(@x, @y, 1)
  end

  def move
    3.times {
      @game.cmd_queue << MoveCommand.new(self, 0, -5)
    }
  end

  def update
    if Gosu::button_down?(Gosu::KbUp)
          move
        end
  end
end