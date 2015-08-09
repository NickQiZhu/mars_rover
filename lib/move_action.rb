require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def initialize(game, vehicle)
    super game, vehicle
  end

  def execute
    x = element.x_pos - Gosu::offset_x(element.angle, STEP_SIZE)
    y = element.y_pos - Gosu::offset_y(element.angle, STEP_SIZE)

    x = 0 if x < 0
    y = 0 if y < 0

    element.set_position(x, y)
  end

end