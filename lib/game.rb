require 'gosu'

require_relative 'background'
require_relative 'tank'
require_relative 'mouse'

class Game < Gosu::Window
  DEFAULT_WIDTH = 1024
  DEFAULT_HEIGHT = 768

  attr_reader :cmd_queue, :elements

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Tank War'
    @cmd_queue = []
    @elements = []
  end

  def setup
    @elements << Background.new(self) << Tank.new(self) << Mouse.new(self)
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