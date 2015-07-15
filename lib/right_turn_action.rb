require_relative 'turn_action'

class RightTurnAction < TurnAction
  def initialize(vehicle)
    super vehicle, TURN_ANGLE
  end
end