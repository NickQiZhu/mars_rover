require 'gosu'

class Game
  DEFAULT_WIDTH = 800
  DEFAULT_HEIGHT = 640

  attr_accessor :window, :background_image

  def self.new_window(width, height)
    window = Gosu::Window.new(width, height)
    window.caption = 'Mars Rover'
    window
  end

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    @window = Game.new_window(width, height)
    @background_image = Gosu::Image.new('media/surface.jpg', :tileable => true)
  end

  def start
     @window.show
  end

  def shutdown
    @window.close
  end
end