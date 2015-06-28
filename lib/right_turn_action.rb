require_relative 'turn_action'

class RightTurnAction < TurnAction
  def initialize(rover)
    super rover, TURN_ANGLE
  end
end