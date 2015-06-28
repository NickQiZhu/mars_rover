require_relative 'base_command'

class MoveCommand < BaseCommand
  STEP_SIZE = -2

  def initialize(rover)
    super rover
  end

  def execute
    x = rover.x - Gosu::offset_x(rover.angle, STEP_SIZE)
    y = rover.y - Gosu::offset_y(rover.angle, STEP_SIZE)

    rover.position(x, y)
  end

  def ==(cmd)
    same_command?(cmd)
  end

end