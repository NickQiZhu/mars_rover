require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def execute
    x = element.x_pos
    y = element.y_pos

    x1 = x - Gosu::offset_x(element.angle, STEP_SIZE)
    y1 = y - Gosu::offset_y(element.angle, STEP_SIZE)

    moved_dup_e = gen_moved_dup(x1, y1)

    if blocked?(moved_dup_e)
      element.set_position(x, y)
    else
      element.set_position(x1, y1)
    end
  end

  private

  def gen_moved_dup(x1, y1)
    dup_element = element.dup
    dup_element.set_position(x1, y1)
    dup_element
  end

  def blocked?(moved_dup_e)
    on_boundaries?(moved_dup_e) || game.collision?(moved_dup_e, [element])
  end

  def on_boundaries?(e)
    x_out_of_bound(e) || y_out_of_bound(e)
  end

  def y_out_of_bound(e)
    e.y_pos < 0 || e.y_pos > game.height
  end

  def x_out_of_bound(e)
    e.x_pos < 0 || e.x_pos > game.width
  end

end