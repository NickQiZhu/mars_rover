require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def initialize(game, rover)
    super game, rover
  end

  def execute
    x = element.x_pos - Gosu::offset_x(element.angle, STEP_SIZE)
    y = element.y_pos - Gosu::offset_y(element.angle, STEP_SIZE)

    element.set_position(x, y)
  end

end