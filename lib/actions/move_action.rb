require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def execute
    x1 = element.x - Gosu::offset_x(element.angle, STEP_SIZE)
    y1 = element.y - Gosu::offset_y(element.angle, STEP_SIZE)

    moved_dup_e = gen_moved_dup(x1, y1)

    if blocked?(moved_dup_e)
      stop_element
    else
      move_element_to(x1, y1)
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
    e.y < 0 || e.y > game.height
  end

  def x_out_of_bound(e)
    e.x < 0 || e.x > game.width
  end

  def stop_element
    element.set_position(element.x, element.y)
  end

  def move_element_to(x1, y1)
    element.set_position(x1, y1)
  end

end