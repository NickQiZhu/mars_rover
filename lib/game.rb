require 'gosu'

require_relative 'background'
require_relative 'rover'

class Game < Gosu::Window
  DEFAULT_WIDTH = 1024
  DEFAULT_HEIGHT = 768

  attr_accessor :background_image, :rover, :cmd_queue, :elements

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Mars Rover'
    @cmd_queue = []
    @elements = []
  end

  def setup
    @elements << Background.new(self) << Rover.new(self)
  end

  def start
    show
  end

  def draw
    redraw_all_elements
  end

  def update
    update_all_elements
  end

  def shutdown
    close
  end

  def button_down(id)
    shutdown if id == Gosu::KbEscape
  end

  private

  def redraw_all_elements
    @elements.each { |e| e.draw }
  end

  def update_all_elements
    @elements.each { |e| e.update(mouse_x, mouse_y) }
  end
end