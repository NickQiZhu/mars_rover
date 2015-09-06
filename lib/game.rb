require 'gosu'

require_relative 'elements/background'
require_relative 'elements/tank'
require_relative 'elements/mouse'
require_relative 'elements/rock'

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
    each_element do |e|
      return true if found_overlap?(e, element, exclude_list)
    end

    false
  end

  private

  def setup_core_elements
    @elements << Background.new(self) << Tank.new(self) << Mouse.new(self)
  end

  def setup_obstacles
    [[400, 200], [490, 220], [580, 210], [460, 290], [550, 300]].each do |position|
      place_rock *position
    end
  end

  def place_rock(x, y)
    @elements << Rock.new(self).set_position(x, y)
  end

  def found_overlap?(e, element, exclude_list)
    e != element && !exclude_list.include?(e) && e.overlap?(element)
  end

  def redraw_all_elements
    each_element { |e| e.draw }
  end

  def update_all_elements
    each_element { |e| e.update(mouse_x, mouse_y) }
  end
end