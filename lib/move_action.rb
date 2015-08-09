require_relative 'base_action'

class MoveAction < BaseAction
  STEP_SIZE = -2

  def initialize(game, vehicle)
    super game, vehicle
  end

  def execute
    x, y = move

    x, y = enforce_boundaries(x, y)

    element.set_position(x, y)
  end

  private

  def move
      x = element.x_pos - Gosu::offset_x(element.angle, STEP_SIZE)
      y = element.y_pos - Gosu::offset_y(element.angle, STEP_SIZE)
      return x, y
    end

  def enforce_boundaries(x, y)
    x = 0 if x < 0
    y = 0 if y < 0

    x = game.width if x > game.width
    y = game.height if y > game.height

    return x, y
  end

end