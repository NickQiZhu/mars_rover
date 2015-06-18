require 'gosu'

class Game < Gosu::Window
  DEFAULT_WIDTH = 800
  DEFAULT_HEIGHT = 640

  attr_accessor :background_image

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super(width, height)
    self.caption = 'Mars Rover'
    @background_image = Gosu::Image.new('media/surface.jpg', :tileable => true)
  end

  def start
    show
  end

  def shutdown
    close
  end
end