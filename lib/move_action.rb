require_relative 'base_action'
require_relative 'position'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def execute
    x, y = move(element.x_pos, element.y_pos)

    element.set_position(x, y)
  end

  private

  def move(x, y)
    x1 = x - Gosu::offset_x(element.angle, STEP_SIZE)
    y1 = y - Gosu::offset_y(element.angle, STEP_SIZE)

    pos = Position.new(x1, y1, element.z_index)

    if on_boundaries?(pos) || game.collision?(pos)
      return x, y
    else
      return x1, y1
    end
  end

  def on_boundaries?(pos)
    pos.x_pos < 0 || pos.y_pos < 0 || pos.x_pos > game.width || pos.y_pos > game.height
  end

end