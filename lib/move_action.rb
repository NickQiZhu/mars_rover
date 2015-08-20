require_relative 'base_action'

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

    if on_boundaries?(x1, y1)
      return x, y
    else
      return x1, y1
    end
  end

  def on_boundaries?(x1, y1)
    x1 < 0 || y1 < 0 || x1 > game.width || y1 > game.height
  end

end