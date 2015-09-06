require_relative 'turn_action'

class RightTurnAction < TurnAction
  def initialize(game, vehicle)
    super game, vehicle, TURN_ANGLE
  end
end