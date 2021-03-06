require_relative '../traits/positionable'

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

  def enqueue_action(action_class)
    BaseAction.enqueue(@action_queue) { action_class.new(game, self) }
  end

  def last_action
    action_queue.last
  end

  protected

  def load_image
    # abstract methods
  end

  def draw_image
    image.draw_rot(x, y, z_index, angle) if image
  end

  private

  def execute_command
    dequeue_command.execute unless @action_queue.empty?
  end

  def dequeue_command
    @action_queue.slice!(0)
  end
end