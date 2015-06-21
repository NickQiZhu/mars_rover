require 'gosu'

require_relative 'rover'

class Game < Gosu::Window
  DEFAULT_WIDTH = 640
  DEFAULT_HEIGHT = 480

  attr_accessor :background_image, :rover, :cmd_queue

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Mars Rover'
    @cmd_queue = []
    @background_image = Gosu::Image.new(self, 'media/surface.png', true)
    @rover = Rover.new(self)
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