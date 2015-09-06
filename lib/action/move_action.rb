require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def execute
    x = element.x_pos
    y = element.y_pos

    x1 = x - Gosu::offset_x(element.angle, STEP_SIZE)
    y1 = y - Gosu::offset_y(element.angle, STEP_SIZE)

    e = element.dup
    e.set_position(x1, y1)

    if on_boundaries?(e) || game.collision?(e, [element])
      element.set_position(x, y)
    else
      element.set_position(x1, y1)
    end
  end

  private

  def on_boundaries?(e)
    e.x_pos < 0 || e.y_pos < 0 || e.x_pos > game.width || e.y_pos > game.height
  end

end