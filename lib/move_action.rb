require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def initialize(rover)
    super rover
  end

  def execute
    x = rover.x_pos - Gosu::offset_x(rover.angle, STEP_SIZE)
    y = rover.y_pos - Gosu::offset_y(rover.angle, STEP_SIZE)

    rover.set_position(x, y)
  end

end