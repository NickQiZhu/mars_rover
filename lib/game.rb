require 'gosu'

class Game < Gosu::Window
  DEFAULT_WIDTH = 640
  DEFAULT_HEIGHT = 480

  attr_accessor :window, :background_image

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Mars Rover'
    @background_image = Gosu::Image.new(self, 'media/surface.png', true)
  end

  def start
     show
  end

  def draw
    @background_image.draw(0,0,0)
  end

  def shutdown
    close
  end
end