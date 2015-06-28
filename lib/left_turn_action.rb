require_relative 'turn_action'

class LeftTurnAction < TurnAction
  def initialize(rover)
    super rover, -TURN_ANGLE
  end
end