require 'gosu'

class Game < Gosu::Window
  DEFAULT_WIDTH = 640
  DEFAULT_HEIGHT = 480

  attr_accessor :background_image, :rover

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Mars Rover'
    @background_image = Gosu::Image.new(self, 'media/surface.png', true)
    @rover = Rover.new
  end

  def start
     show
  end

  def draw
    @background_image.draw(0,0,0)
    @rover.draw
  end

  def shutdown
    close
  end
end