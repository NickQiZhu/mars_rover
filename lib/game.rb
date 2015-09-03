require 'gosu'

require_relative 'background'
require_relative 'tank'
require_relative 'mouse'
require_relative 'rock'

class Game < Gosu::Window
  DEFAULT_WIDTH = 1024
  DEFAULT_HEIGHT = 768

  attr_reader :cmd_queue

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT)
    super width, height
    self.caption = 'Tank War'
    @cmd_queue = []
    @elements = []
  end

  def setup
    setup_core_elements

    setup_obstacles
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

  def elements
    @elements.dup
  end

  def add_element(e)
    @elements << e
  end

  def remove_element(e)
    @elements.delete e
  end

  def each_element(&block)
    @elements.each &block
  end

  def collision?(element, exclude_list = [])
    each_element { |e|
      if e != element && !exclude_list.include?(e) && e.overlap?(element)
        return true
      end
    }
    false
  end

  private

  def setup_core_elements
    @elements << Background.new(self) << Tank.new(self) << Mouse.new(self)
  end

  def setup_obstacles
    @elements << Rock.new(self).set_position(400, 200)
    @elements << Rock.new(self).set_position(490, 220)
    @elements << Rock.new(self).set_position(580, 210)
    @elements << Rock.new(self).set_position(460, 290)
    @elements << Rock.new(self).set_position(550, 320)
  end

  def redraw_all_elements
    each_element { |e| e.draw }
  end

  def update_all_elements
    each_element { |e| e.update(mouse_x, mouse_y) }
  end
end