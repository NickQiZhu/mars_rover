require_relative 'positionable'

class VisualElement
  attr_accessor :image, :action_queue
  attr_reader :game

  include Positionable

  def initialize(game)
    @game = game
    @action_queue = []
    set_position 0, 0, 0

    load_image
  end

  def draw
    execute_command
    draw_image
  end

  def update(mouse_x, mouse_y)
    # abstract methods
  end

  def pressed?(key)
    Gosu::button_down?(key)
  end

  def z_index
    1
  end

  protected

  def load_image
    # abstract methods
  end

  def draw_image
    image.draw_rot(x_pos, y_pos, z_index, angle)
  end

  private

  def execute_command
    unless @action_queue.empty?
      dequeue_command.execute
    end
  end

  def dequeue_command
    @action_queue.slice!(0)
  end
end