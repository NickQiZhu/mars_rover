require 'gosu'

require_relative 'rover'

class Game < Gosu::Window
  DEFAULT_WIDTH = 640
  DEFAULT_HEIGHT = 480

  attr_accessor :background_image, :rover, :cmd_queue, :elements

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Mars Rover'
    @elements = []
    @cmd_queue = []
  end

  def start
     show
  end

  def draw
    @cmd_queue.each{|cmd| cmd.execute }
    @elements.each{|e| e.draw }
  end

  def shutdown
    close
  end
end