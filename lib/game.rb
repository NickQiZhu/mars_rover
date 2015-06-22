require 'gosu'

require_relative 'background'
require_relative 'rover'

class Game < Gosu::Window
  DEFAULT_WIDTH = 640
  DEFAULT_HEIGHT = 480

  attr_accessor :background_image, :rover, :cmd_queue, :elements

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Mars Rover'
    @cmd_queue = []
    @elements = []
  end

  def setup
    @elements << Background.new << Rover.new(self)
  end

  def start
    show
  end

  def draw
    unless @cmd_queue.empty?
      @cmd_queue.slice!(0).execute
    end

    @elements.each { |e| e.draw }
  end

  def update
    @elements.each {|e| e.update }
  end

  def shutdown
    close
  end
end