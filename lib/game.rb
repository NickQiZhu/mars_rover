require 'gosu'

class Game < Gosu::Window
  DEFAULT_WIDTH = 800
  DEFAULT_HEIGHT = 640


  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super(width, height)
  end

  def start
    show
  end

  def shutdown
    close
  end
end